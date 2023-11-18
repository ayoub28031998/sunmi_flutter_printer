import 'package:flutter/material.dart';
import 'dart:convert';

Widget ItemWidget(image, productTitle, prix, {onClick}) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            child: imageFromBase64String(image.toString()),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          padding: EdgeInsets.only(bottom: 8),
          alignment: Alignment.centerLeft,
          child: Text(
            productTitle,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFF4C53A5),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                prix.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
              Spacer(),
              SizedBox(
                height: 30,
                width: 30,
                child: IconButton(
                  onPressed: onClick,
                  icon: Icon(
                    Icons.shopping_cart_checkout,
                    color: Color(0xFF4C53A5),
                  ),
                ),
              ),

            ],
          ),
        )
      ],
    ),
  );
}

Widget imageFromBase64String(String base64String) {
  return Image.memory(
    base64.decode(base64String),
    fit: BoxFit.cover,
    height: 80,
    width: 80,
  );
}
