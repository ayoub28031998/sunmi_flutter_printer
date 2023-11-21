class CartItem {
  final String logo;
  final String designation;
  final double prixVenteTtc;
  int qte;
  final String codeArticle;

  CartItem({
    required this.logo,
    required this.designation,
    required this.prixVenteTtc,
    required this.qte,
    required this.codeArticle,
  });

  Map<String, dynamic> toJson() {
    return {
      'codeArticle': codeArticle,
      'qte': qte,
      'logo': "",
      'designation': designation,
      'prixVenteTtc': prixVenteTtc,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      codeArticle: json['codeArticle'],
      qte: json['qte'],
      logo: json['logo'],
      designation: json['designation'],
      prixVenteTtc: json['prixVenteTtc'],
    );
  }
}
