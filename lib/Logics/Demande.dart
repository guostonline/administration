import 'dart:convert';

class Demande {
  String user;
  String dateDeComande;
  String categorie;
  String localite;
  String destination;
  String desLe;
  String jusqua;
  bool chargeDecharge;
  bool montageDemontage;
  bool besoiEmballage;
  int nombreDeSalon;
  bool demnadeDeFacture;
  int quantite;
  int poids;
  bool vue;
  bool repondu;
  bool refus;
  double montont;
  bool valider;
  Demande({
    this.user,
    this.dateDeComande,
    this.categorie,
    this.localite,
    this.destination,
    this.desLe,
    this.jusqua,
    this.chargeDecharge,
    this.montageDemontage,
    this.besoiEmballage,
    this.nombreDeSalon,
    this.demnadeDeFacture,
    this.quantite,
    this.poids,
    this.vue,
    this.repondu,
    this.refus,
    this.montont,
    this.valider,
  });

  Map<String, dynamic> toMap() {
    return {
      'User': user,
      'Date de comande': dateDeComande,
      'Categorie': categorie,
      'Localite': localite,
      'Destination': destination,
      'DesLe': desLe,
      "Jusqua": jusqua,
      'Chargement-Dechargment': chargeDecharge,
      'Montage-Demontage': montageDemontage,
      "Besoin-Embalage": besoiEmballage,
      'Nombre de salons': nombreDeSalon,
      'Demande de Facture': demnadeDeFacture,
      'Quantite': quantite,
      'Poids': poids,
      'Vue': vue,
      'Repondu': repondu,
      'Refus': refus,
      'Montant': montont,
      'Valider': valider,
    };
  }

  factory Demande.fromMap(Map<String, dynamic> map) {
    return Demande(
      user: map['User'],
      dateDeComande: map['Date de comande'],
      categorie: map['Categorie'],
      localite: map['Localite'],
      destination: map['Destination'],
      desLe: map['DesLe'],
      jusqua: map["Jusqua"],
      chargeDecharge: map['Chargement-Dechargment'],
      montageDemontage: map['Montage-Demontage'],
      besoiEmballage: map["Besoin-Embalage"],
      nombreDeSalon: map['Nombre de salons'],
      demnadeDeFacture: map['Demande de Facture'],
      quantite: map['Quantite'],
      poids: map['Poids'],
      vue: map['Vue'],
      repondu: map['Repondu'],
      refus: map['Refus'],
      montont: map['Montant'],
      valider: map['Valider'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Demande.fromJson(String source) =>
      Demande.fromMap(json.decode(source));
}
