
import 'package:flutter/material.dart';
import 'package:flowershop/pages/cart_page.dart';
import 'package:flowershop/pages/confirm_page.dart';
import 'package:flowershop/pages/customize_page.dart';
import 'package:flowershop/pages/delivery_page.dart';
import 'package:flowershop/pages/gallery_page.dart';
import 'package:flowershop/pages/home_page.dart';
import 'package:flowershop/pages/login_page.dart';
import 'package:flowershop/pages/notif_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }

}
