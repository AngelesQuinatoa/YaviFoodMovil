import 'package:flutter/material.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/screen/comida.dart';
import 'auth/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: homepage(),
    );
  }
}


