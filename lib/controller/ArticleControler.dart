import 'dart:convert';
import 'package:StubSoft/Models/ArticleDTO.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http ;

import 'package:StubSoft/config/global.params.dart';
class ArticleControler extends GetxController{
  String urlApi=GlobalParams().urlApi+"Articles/";
  Future <List<ArticleDTO>> getArticleByCodeFamille(String codeFamille,bool afficherTout ) async {
    final response = await http.get(Uri.parse( this.urlApi+codeFamille));
    if (response.statusCode == 200) {
      final List<dynamic> articleJson = json.decode(utf8.decode(response.bodyBytes));
      print(articleJson.length);
      final article = articleJson.map((json) => ArticleDTO.fromJson(json)).toList();
      return article;
    } else {
      throw Exception('Failed to load Article');
    }
  }

}


// import 'dart:convert';
//
// import 'package:facturation_mef/Model/Accompte.Model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
//
// class AccompteController extends GetxController{
//
//    static const String apiUrlPoste = "http://localhost:8091/saveAcompte" ;
//
//    Stream<List<Accompte>> getPersonneldetails(String Nomprenom ) async* {
//       print(Nomprenom);
//       final response = await http.get(Uri.parse( 'http://localhost:8091/NomPrenom/'+Nomprenom+''));
//       if (response.statusCode == 200) {
//          final List<dynamic> accompteJson = json.decode(utf8.decode(response.bodyBytes));
//
//          final acompte = accompteJson.map((json) => Accompte.fromJson(json)).toList();
//
//          yield acompte;
//       } else {
//          throw Exception('Failed to load Personnel');
//       }
//    }
//
//    Stream<List<Accompte>> getPersonnelbyid(int id ) async* {
//       final response = await http.get(Uri.parse( 'http://10.0.2.2:8091/getBypersonnel/'+id.toString()+''));
//       if (response.statusCode == 200) {
//          final List<dynamic> accompteJson = json.decode(utf8.decode(response.bodyBytes));
//
//          final acompte = accompteJson.map((json) => Accompte.fromJson(json)).toList();
//
//          yield acompte;
//       } else {
//          throw Exception('Failed to load Personnel');
//       }
//    }
//
//    static Future<Accompte> postAccompte(Accompte accompte, ) async {
//       final response = await http.post(
//          Uri.parse(apiUrlPoste),
//          headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//          },
//          body: jsonEncode(accompte.toJson()),
//       );
//       if (response.statusCode == 201) {
//          return  Accompte.fromJson(json.decode(utf8.decode(response.bodyBytes)));
//       } else {
//          throw Exception('Failed to create client');
//       }
//
//    }
// }