import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItemSamples2 extends StatefulWidget {
  final String designation;
  final double prix;

  CartItemSamples2({required this.designation, required this.prix});

  @override
  State<CartItemSamples2> createState() => _CartItemSamplesState2();
}

class _CartItemSamplesState2 extends State<CartItemSamples2> {
  late SharedPreferences prefs;
  int i = 1;

  void _delete() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('Selected2', false);
      Navigator.pop(context);
      Navigator.pushNamed(context, "/cartPage");
      prefs.setInt('panier', (prefs.getInt('panier') ?? 0) - 1);
    });
  }

  void _incrmente() {
    setState(() {
      i++;
    });
  }

  void _decremente() {
    setState(() {
      if (i > 0) i--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: EdgeInsets.only(right: 15),
                child: Image.asset("images/2.jpeg"),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.designation, // Utilisation du paramètre designation
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                    Text(
                      "prix: ${i * (widget.prix * 0.35)}dt", // Utilisation du paramètre prix
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        _delete();
                      },
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: IconButton(
                              icon: Icon(CupertinoIcons.plus),
                              iconSize: 18,
                              onPressed: () {
                                _incrmente();
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "$i",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: IconButton(
                              icon: Icon(CupertinoIcons.minus),
                              iconSize: 18,
                              onPressed: () {
                                _decremente();
                              },
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
