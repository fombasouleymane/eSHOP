// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:art_eshop/mobil/models/panier_Entirty.dart';

class Utilisateur {
  int? idUser;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? pays;
  String? adresse;
  Panier? panier;
  Utilisateur({
    this.idUser,
    this.nom,
    this.prenom,
    this.email,
    this.password,
    this.pays,
    this.adresse,
    this.panier,
  });
  

  Utilisateur copyWith({
    int? idUser,
    String? nom,
    String? prenom,
    String? email,
    String? password,
    String? pays,
    String? adresse,
    Panier? panier,
  }) {
    return Utilisateur(
      idUser: idUser ?? this.idUser,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      password: password ?? this.password,
      pays: pays ?? this.pays,
      adresse: adresse ?? this.adresse,
      panier: panier ?? this.panier,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idUser': idUser,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
      'pays': pays,
      'adresse': adresse,
      'panier': panier?.toMap(),
    };
  }

  factory Utilisateur.fromMap(Map<String, dynamic> map) {
    return Utilisateur(
      idUser: map['idUser'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      password: map['password'],
      pays: map['pays'],
      adresse: map['adresse'],
      panier: Panier.fromMap(map['panier']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Utilisateur.fromJson(String source) => Utilisateur.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Utilisateur(idUser: $idUser, nom: $nom, prenom: $prenom, email: $email, password: $password, pays: $pays, adresse: $adresse, panier: $panier)';
  }

  @override
  bool operator ==(covariant Utilisateur other) {
    if (identical(this, other)) return true;
  
    return 
      other.idUser == idUser &&
      other.nom == nom &&
      other.prenom == prenom &&
      other.email == email &&
      other.password == password &&
      other.pays == pays &&
      other.adresse == adresse &&
      other.panier == panier;
  }

  @override
  int get hashCode {
    return idUser.hashCode ^
      nom.hashCode ^
      prenom.hashCode ^
      email.hashCode ^
      password.hashCode ^
      pays.hashCode ^
      adresse.hashCode ^
      panier.hashCode;
  }
}
