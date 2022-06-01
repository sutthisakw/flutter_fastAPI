import 'package:flutter/material.dart';
import 'package:flutter_workshop/pages/addForm.dart';
import 'package:flutter_workshop/pages/editForm.dart';
import 'package:flutter_workshop/pages/home.dart';
import 'package:flutter_workshop/pages/login.dart';
import 'package:flutter_workshop/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/register' : (context) => const RegisterScreen(),
      '/home': (context) => HomeScreen(),
      '/addform': (context) => AddForm(),
      '/editform': (context) => EditForm(),
      '/login': (context) => LoginScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}