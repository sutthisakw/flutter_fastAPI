import 'package:flutter/material.dart';
import 'package:flutter_workshop/components/userForm.dart';
import 'package:flutter_workshop/networks/userAPI.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Container(
        child: UserForm(
          submit: register,
          textButton: 'Register',
        ),
      ),
    );
  }

  register(String username, String password) async {
    UserAPI userAPI = UserAPI();
    String msg = await userAPI.register(username: username, password: password);
    SnackBar msgAlertRegis = SnackBar(content: Text(msg));
    ScaffoldMessenger.of(context).showSnackBar(msgAlertRegis);
    Navigator.pop(context);
  }
}
