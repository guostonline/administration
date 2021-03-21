import 'dart:convert';

class Demande {
  String categorie;
  String localite;
  String destination;

  Demande({
    this.categorie,
    this.localite,
    this.destination,
  });

  Map<String, dynamic> toMap() {
    return {
      'Categorie': categorie,
      'Localite': localite,
      'Destination': destination,
    };
  }

  factory Demande.fromMap(Map<String, dynamic> map) {
    return Demande(
      categorie: map['Categorie'],
      localite: map['Localite'],
      destination: map['Destination'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Demande.fromJson(String source) =>
      Demande.fromMap(json.decode(source));
}
