import 'package:flutter/material.dart';
import 'package:seventh/src/page/home/page/home_page.dart';
import 'package:seventh/src/page/login/page/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Seventh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}

