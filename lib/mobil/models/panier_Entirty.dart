// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'dart:convert';

import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/commande_Entity.dart';

class Panier {
  int? idPanier;
  // Commande? commandes;
  String? date;
  // Utilisateur? user;
  Panier({
    this.idPanier,
    // this.commandes,
    this.date,
    // this.user,
  });

  Panier copyWith({
    int? idPanier,
    // Commande? commandes,
    String? date,
    // Utilisateur? user,
  }) {
    return Panier(
      idPanier: idPanier ?? this.idPanier,
      // commandes: commandes ?? this.commandes,
      date: date ?? this.date,
      // user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idPanier': idPanier,
      // 'commandes': commandes?.toMap(),
      'date': date,
      // 'user': user?.toMap(),
    };
  }

  factory Panier.fromMap(Map<String, dynamic> map) {
    return Panier(
      idPanier: map['idPanier'],
      // commandes: map['commandes'],
      date: map['date'],
      // user: map['user'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Panier.fromJson(String source) => Panier.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Panier(idPanier: $idPanier, date: $date)';
  }

  @override
  bool operator ==(covariant Panier other) {
    if (identical(this, other)) return true;

    return other.idPanier == idPanier &&
        // other.commandes == commandes &&
        other.date == date;
    // other.user == user;
  }

  @override
  int get hashCode {
    return idPanier.hashCode ^ date.hashCode;
    // user.hashCode;
  }
}
