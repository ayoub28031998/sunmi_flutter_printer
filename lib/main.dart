import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Importez Get

import 'page/LoginPage.dart';
import 'page/homePage.dart';
import 'page/cartPage.dart';

void main() {
  runApp(GetMaterialApp(
    // Utilisez GetMaterialApp au lieu de MaterialApp
    debugShowCheckedModeBanner: false,
    // Définissez votre page initiale avec home
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => HomePage(),
    '/login': (context) => LoginPage(),
    '/cartPage': (context) => CartPage(cartItems: []),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
