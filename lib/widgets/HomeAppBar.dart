import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:StubSoft/main.dart';
import '../page/LoginPage.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final int panierCount;

  HomeAppBar({required this.panierCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirmation"),
                    content: Text("Voulez-vous déconnecter de l'application ?"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Annuler"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Ferme la boîte de dialogue
                        },
                      ),
                      TextButton(
                        child: Text("Confirmer"),
                        onPressed: () {
                          Navigator.of(context).pop(); // Ferme la boîte de dialogue
                          // Poursuit l'action ici
                          Get.offAll(MyApp()); // Exemple de redirection
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Icon(
              Icons.exit_to_app,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),




          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Plantes Shopping',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
          Spacer(),
          badges.Badge(
            badgeColor: Colors.red,
            padding: EdgeInsets.all(7),
            badgeContent: Text(
              "$panierCount",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "/cartPage");
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Color(0xFF4C53A5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
