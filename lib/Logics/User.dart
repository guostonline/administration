import 'dart:convert';

class User {
  String name;
  String email;
  String numberPhone;
  String photoUrl;
  User({
    this.name,
    this.email,
    this.numberPhone,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'Nom et prenom': name,
      'Email': email,
      'Téléphone': numberPhone,
      'Photo url': photoUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['Nom et prenom'],
      email: map['Email'],
      numberPhone: map['Téléphone'],
      photoUrl: map['Photo url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
