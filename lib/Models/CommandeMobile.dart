import 'CartItem.dart';

class CommandeMobile {
   List<CartItem> articles;
   String numTable;

  CommandeMobile({
    required this.articles,
    required this.numTable,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> articlesJson =
    articles.map((article) => article.toJson()).toList();

    return {
      'articles': articlesJson,
      'numTable': numTable,
    };
  }

  factory CommandeMobile.fromJson(Map<String, dynamic> json) {
    // Convertir la liste d'articles JSON en une liste d'objets CartItem
    List<dynamic> articlesJson = json['articles'];
    List<CartItem> articles = articlesJson.map((articleJson) {
      return CartItem.fromJson(articleJson);
    }).toList();

    return CommandeMobile(
      articles: articles,
      numTable: json['numTable'],
    );
  }
}
