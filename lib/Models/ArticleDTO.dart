
import 'dart:collection';
import 'dart:ffi';
class ArticleDTO {
  String codeArticle;
  String codeFamille;
  String codeSousFamille;
  String codeType;
  String codeMarque;
  String codeUnite;
  String? codeUniteVente;
  double valeurUniteVente;
  String designation;
  double dernierPrixAchatHt;
  double dernierTauxRemise;
  double prixAchatHt;
  double marge;
  double prixVenteHt;
  String codeTva;
  double prixVenteTtc;
  double liteTauxRemise;
  bool? fodec;
  bool? stockable;
  bool? actif;
  bool? tailleCouleur;
  String observation;
  bool? numeroSerie;
  String codeBarre;
  String? imageCodeBarre;
  String? logo;
  double? prixVenteNetHt;
  double prixVenteTtcsansRemise;
  double prixAchatTtcsansRemise;
  double prixVenteHtemporter;
  String codeTvaemporter;
  double prixVenteTtcemporter;
  bool? avecAccompagnement;
  bool? vendu;
  String? codeDepotVente;
  bool compose;
  double valeurConversionUniteAchatVente;
  double prixAchatTtc;
  bool venteEnDetails;
  double valeurUniteAchat;
  String codeArticleDeduction;
  bool? grammage;
  bool vip;
  double tauxTva;

  ArticleDTO(
      {
        required this.codeArticle,
        required this.codeFamille,
        required this.codeSousFamille,
        required this.codeType,
        required this.codeMarque,
        required this.codeUnite,
        required this.codeUniteVente,
        required this.valeurUniteVente,
        required this.designation,
        required this.dernierPrixAchatHt,
        required this.dernierTauxRemise,
        required this.prixAchatHt,
        required this.marge,
        required this.prixVenteHt,
        required this.codeTva,
        required this.prixVenteTtc,
        required this.liteTauxRemise,
        required this.fodec,
        required this.stockable,
        required this.actif,
        required this.tailleCouleur,
        required this.observation,
        required this.numeroSerie,
        required this.codeBarre,
        required this.imageCodeBarre,
        required this.logo,
        required this.prixVenteNetHt,
        required this.prixVenteTtcsansRemise,
        required this.prixAchatTtcsansRemise,
        required this.prixVenteHtemporter,
        required this.codeTvaemporter,
        required this.prixVenteTtcemporter,
        required this.avecAccompagnement,
        required this.vendu,
        required this.codeDepotVente,
        required this.compose,
        required this.valeurConversionUniteAchatVente,
        required this.prixAchatTtc,
        required this.venteEnDetails,
        required this.valeurUniteAchat,
        required this.codeArticleDeduction,
        required  this.grammage,
        required this.vip,
        required this.tauxTva,
      }
      ); // Constructor if needed
  factory ArticleDTO.fromJson(Map<String, dynamic> json) {
    return ArticleDTO(
        codeArticle : json['codeArticle']  ,
        codeFamille : json['codeFamille']  ,
        codeSousFamille : json['codeSousFamille']  ,
        codeType : json['codeType']  ,
        codeMarque : json['codeMarque']  ,
        codeUnite : json['codeUnite']    ,
        codeUniteVente : json['codeUniteVente'],
        valeurUniteVente : json['valeurUniteVente']  ,
        designation : json['designation']  ,
        dernierPrixAchatHt : json['dernierPrixAchatHt']  ,
        dernierTauxRemise : json['dernierTauxRemise']  ,
        prixAchatHt : json['prixAchatHt']  ,
        marge : json['marge']  ,
        prixVenteHt : json['prixVenteHt']  ,
        codeTva : json['codeTva'] ?? '',
        prixVenteTtc : json['prixVenteTtc'] ,
        liteTauxRemise : json['liteTauxRemise']  ,
        fodec : json['fodec'] as bool? ?? false ,
        stockable : json['stockable'] as bool? ?? false ,
        actif : json['Actif'] as bool? ?? false,
        tailleCouleur : json['tailleCouleur']as bool? ?? false  ,
        observation : json['observation']  ,
        numeroSerie : json['numeroSerie'] as bool? ?? false ,
        codeBarre : json['codeBarre'] ,
        imageCodeBarre : json['imageCodeBarre'],
        logo : json['logo'],
        prixVenteNetHt : json['prixVenteNetHt'],
        prixVenteTtcsansRemise : json['prixVenteTtcsansRemise']  ,
        prixAchatTtcsansRemise : json['prixAchatTtcsansRemise'] ,
        prixVenteHtemporter : json['prixVenteHtemporter'] ,
        codeTvaemporter : json['codeTvaemporter']  ,
        prixVenteTtcemporter : json['prixVenteTtcemporter']  ,
        avecAccompagnement : json['avecAccompagnement'] as bool? ?? false ,
        vendu : json['vendu']as bool? ?? false,
        codeDepotVente : json['codeDepotVente'],
        compose : json['compose'] as bool? ?? false ,
        valeurConversionUniteAchatVente : json['valeurConversionUniteAchatVente']  ,
        prixAchatTtc : json['prixAchatTtc'] ,
        venteEnDetails : json['venteEnDetails'] as bool? ?? false ,
        valeurUniteAchat : json['valeurUniteAchat'] ,
        codeArticleDeduction : json['codeArticleDeduction']  ,
        grammage : json['grammage']as bool? ?? false,
        vip : json['vip'] as bool? ?? false ,
        tauxTva : json['tauxTva']

    );
  }
// Other methods or constructors can be added here if necessary
}
