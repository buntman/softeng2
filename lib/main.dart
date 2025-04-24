import 'package:flutter/material.dart';
import 'package:flowershop/pages/login_page.dart';
import 'package:flowershop/pages/profile_page.dart';
import 'package:flowershop/pages/edit_profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
