import 'dart:convert';
import 'package:StubSoft/Models/CartItem.dart';
import 'package:StubSoft/Models/CommandeMobile.dart';
import 'package:StubSoft/Models/FamilleArticleDTO.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;

import 'package:StubSoft/config/global.params.dart';

import '../sunmi.dart';

class CommandeMobileController extends GetxController {
  Future<bool> postAccompte(List<CartItem> articles) async {
    try {
      CommandeMobile cm = CommandeMobile(articles: articles, numTable: "SX10");

      String urlApi = GlobalParams().urlApi + "CommandeWebs/AddCommande/MobileApp";
      final response = await http.post(
        Uri.parse(urlApi),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(cm.toJson()),
      );
      print(response.statusCode);
      if (response.statusCode == 500) {
        Sunmi printer = Sunmi();
        printer.printReceipt(articles, 123);
        Get.snackbar(
          'Succès', // Titre de la snackbar
          'La commande a été ajoutée avec succès', // Message de la snackbar
          backgroundColor: Colors.green, // Couleur de fond de la snackbar
          colorText: Colors.white, // Couleur du texte de la snackbar
        );

        return true; // Succès, renvoie true
      } else {
        // Si la requête a échoué, lancez une exception avec le message d'erreur
        throw Exception('Failed to create client: ${response.statusCode}');
      }
    } catch (error) {
      // Attrapez toute exception survenue pendant la requête
      throw Exception('Failed to create client: $error');
      return false; // Échec, renvoie false
    }
  }

}
