import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_workshop/networks/userAPI.dart';
import 'package:flutter_workshop/models/stock.dart';

class InventoryAPI {
  String url = 'https://my-api-v1.herokuapp.com/inventory';
  UserAPI userAPI = UserAPI();

  Future<List<Stock?>?> getAll() async {
    String? TOKEN = await userAPI.getToken();
    var urlAPI = Uri.parse('$url/');
    final response = await http.get(
      urlAPI,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $TOKEN'
      },
    );
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      List<Stock> data = result.map((e) => Stock.fromJson(e)).toList();
      return data;
    }
    return null;
  }

  // create API add stock
  Future<Stock?> createStock({required Stock stock}) async {
    String? TOKEN = await userAPI.getToken();
    var urlAPI = Uri.parse('$url/');
    final response = await http.post(urlAPI,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN'
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(stock));
    if (response.statusCode == 200) {
      final resualt = jsonDecode(response.body);
      return Stock.fromJson(resualt);
    }
    return null;
  }

  // update API stock
  Future<Stock?>updateStock({required Stock stock}) async {
    String? TOKEN = await userAPI.getToken();
    var urlAPI = Uri.parse('$url/${stock.id}');
    final response = await http.put(urlAPI,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN'
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(stock));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return Stock.fromJson(result);
    }
    return null;
  }

  // delete API stock
  Future<String?> deleteStock({required int id}) async {
    String? TOKEN = await userAPI.getToken();
    var urlAPI = Uri.parse('$url/?id=$id');
    final response = await http.delete(urlAPI, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $TOKEN'
    });
    if (response.statusCode == 200) {
      return jsonDecode(response.body)["detail"];
    } else {
      return '$urlAPI';
    }
  }
}
