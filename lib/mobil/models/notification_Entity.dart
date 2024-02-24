// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'dart:convert';

import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/commande_Entity.dart';

class NotificationClass {
  int? idNotification;
  String? description;
  String? date;
  Commande? commandes;
  Produit? produits;
  Artisan? artisans;
  NotificationClass({
    this.idNotification,
    this.description,
    this.date,
    this.commandes,
    this.produits,
    this.artisans,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idNotification': idNotification,
      'description': description,
      'date': date,
      'commandes': commandes?.toMap(),
      'produits': produits?.toMap(),
      'artisans': artisans?.toMap(),
    };
  }

  factory NotificationClass.fromMap(Map<String, dynamic> map) {
    return NotificationClass(
      idNotification: map['idNotification'] ,
      description: map['description'] ,
      date: map['date'],
      commandes: map['commandes'] != null ? Commande.fromMap(map['commandes']) : null,
      produits: Produit.fromMap(map['produits']),
      artisans: Artisan.fromMap(map['artisans']),
    );
  }

  String toJson() => json.encode(toMap());

  factory NotificationClass.fromJson(String source) => NotificationClass.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Notification(idNotification: $idNotification, description: $description, date: $date, commandes: $commandes, produits: $produits, artisans: $artisans)';
  }

  @override
  bool operator ==(covariant NotificationClass other) {
    if (identical(this, other)) return true;
  
    return 
      other.idNotification == idNotification &&
      other.description == description &&
      other.date == date &&
      other.commandes == commandes &&
      other.produits == produits &&
      other.artisans == artisans;
  }

  @override
  int get hashCode {
    return idNotification.hashCode ^
      description.hashCode ^
      date.hashCode ^
      commandes.hashCode ^
      produits.hashCode ^
      artisans.hashCode;
  }
}
