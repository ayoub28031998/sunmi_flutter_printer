import 'dart:collection';
import 'dart:ffi';
class FamilleArticleDTO{
  String CodeFamille;
  String Libelle;
  String LogoFamille;
  String NumeroImprimante;
  String CodeFamilleGlobal;
  String CodeTypeCart;

  FamilleArticleDTO({
    required this.CodeFamille,
    required this.Libelle,
    required this.LogoFamille,
    required this.NumeroImprimante,
    required this.CodeFamilleGlobal,
    required this.CodeTypeCart,
});

  factory FamilleArticleDTO.fromJson(Map<String, dynamic> json)
  {
    return FamilleArticleDTO
      (
      CodeFamille : json['codeFamille']  ,
      Libelle : json['libelle']  as String? ?? '' ,
      LogoFamille : json['logoFamille']   as String? ?? '',
      NumeroImprimante : json['numeroImprimante']  ,
      CodeFamilleGlobal : json['codeFamilleGlobal']  ,
      CodeTypeCart : json['codeTypeCart']    ,
    );
  }
}