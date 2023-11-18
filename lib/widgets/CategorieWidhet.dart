import 'dart:convert';

import 'package:flutter/material.dart';


class CategoriesWidget extends StatelessWidget {
  final String categoryName;
  final bool isActive;

  const CategoriesWidget(this.categoryName, {this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: isActive ?  Color(0xFF4C53A5) : Color(0xFFB8B4F3), // Définir la couleur en fonction de isActive
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        categoryName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// The imageFromBase64String function remains the same
Image imageFromBase64String(String? base64String) {
  if (base64String == null || base64String.isEmpty) {
    return Image.asset('path/to/placeholder_image.png', width: 40, height: 40, fit: BoxFit.cover);
  }

  return Image.memory(
    base64.decode(base64String),
    fit: BoxFit.cover,
    width: 40,
    height: 40,
  );
}
