import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page/homePage.dart';
import 'page/cartPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => HomePage(),
    '/cartPage': (context) => CartPage(cartItems: [])};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
