import 'dart:convert';
import 'package:StubSoft/Models/CartItem.dart';
import 'package:StubSoft/Models/CommandeMobile.dart';
import 'package:StubSoft/Models/UserDTO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;

import 'package:StubSoft/config/global.params.dart';

import '../page/homePage.dart';
import '../sunmi.dart';

class AuthentificateController extends GetxController {



  Future<void> login(UserDTO user) async {
    try {
      final response = await http.get(
        Uri.parse('${GlobalParams().urlApi}Utilisateurs/${user.user}/${user.password}'),
      );
      print (response);
      if (response.statusCode == 200) {
        final bool isAuthenticated = json.decode(response.body);

        if (isAuthenticated) {
          Get.snackbar(
            'Succès', // Titre de la snackbar
            'Connexion avec succès', // Message de la snackbar
            backgroundColor: Colors.green, // Couleur de fond de la snackbar
            colorText: Colors.white, // Couleur du texte de la snackbar
          );
          Get.off(HomePage());
        } else {
          throw Exception('Échec de l\'authentification');
        }
      } else {
        throw Exception('Échec de l\'authentification');
      }
    } catch (e) {
      print('Erreur lors de l\'authentification: $e');
      throw Exception('Échec de l\'authentification');
    }
  }

}
