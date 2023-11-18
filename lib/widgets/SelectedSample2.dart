import 'CarteSample2.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'CarteSamples.dart';

@override
@override
Widget SelectedSample2() {
  return FutureBuilder<SharedPreferences>(
    future: SharedPreferences.getInstance(),
    builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
      if (prefs.hasData) {
        var sharedPreferences = prefs.data!;
        bool select2 = sharedPreferences.getBool('Selected2') ?? false;
        if (select2) {
          // Ici, vous devrez fournir les valeurs de 'designation' et 'prix'
          // pour instancier correctement CartItemSamples2
          String designation = 'Votre designation'; // Remplacez par la vraie valeur
          double prix = 0.0; // Remplacez par la vraie valeur

          return CartItemSamples2(designation: designation, prix: prix);
        }
      }
      return SizedBox(width: 0, height: 0);
    },
  );
}