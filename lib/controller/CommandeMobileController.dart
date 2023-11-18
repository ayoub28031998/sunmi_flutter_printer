import 'dart:convert';
import 'package:StubSoft/Models/CartItem.dart';
import 'package:StubSoft/Models/CommandeMobile.dart';
import 'package:StubSoft/Models/FamilleArticleDTO.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;

import 'package:StubSoft/config/global.params.dart';

import '../sunmi.dart';

class CommandeMobileController extends GetxController {
   Future<CommandeMobile> postAccompte(List<CartItem> articles) async {
    try {
      print(articles.length);
      CommandeMobile cm = CommandeMobile(articles: articles, numTable: "10");
      print (cm.toJson());
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
        return CommandeMobile.fromJson(jsonDecode(response.body));
      } else {
        // Si la requête a échoué, lancez une exception avec le message d'erreur
        throw Exception('Failed to create client: ${response.statusCode}');
      }
    } catch (error) {
      // Attrapez toute exception survenue pendant la requête
      throw Exception('Failed to create client: $error');
    }
  }
}
