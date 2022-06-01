import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_workshop/models/modelLogin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAPI {
  String url = 'https://my-api-v1.herokuapp.com';

  Future<String> register(
      {required String username, required String password}) async {
    var urlAPI = Uri.parse('$url/users/');
    final response = await http.post(urlAPI,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'username': username, 'password': password}));
    print(response.body);

    if (response.statusCode == 200) {
      return 'Register Completed';
    } else if (response.statusCode == 400) {
      return 'User already registered';
    } else {
      return 'An account with this username is already created. Please try again.';
    }
  }

  Future<Login?> login(
      {required String username, required String password}) async {
    var urlAPI = Uri.parse('$url/token');
    final response = await http.post(urlAPI,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        encoding: Encoding.getByName('utf-8'),
        body: {'username': username, 'password': password});
    print(response.body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Login? login = Login.fromJson(result);
      return login;
    }
    return null;
  }

  storeToken({required String token}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?>getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString('token');
  }
}
