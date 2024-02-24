// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'dart:convert';

import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/achat_Entity.dart';
import 'package:art_eshop/mobil/models/couleur_Entity.dart';
import 'package:art_eshop/mobil/models/panier_Entirty.dart';

class Commande {
  int? idCommande;
  double? quantite;
  Produit? produits;
  String? date;
  Panier? panier;
  TailleProduit? tailleProduit;
  CouleursProduit? couleursProduit;
  Utilisateur? utilisateur;
  Commande({
    this.idCommande,
    this.quantite,
    this.produits,
    this.date,
    this.panier,
    this.tailleProduit,
    this.couleursProduit,
    this.utilisateur,
  });

  Commande copyWith({
    int? idCommande,
    double? quantite,
    Produit? produits,
    String? date,
    Panier? panier,
    TailleProduit? tailleProduit,
    CouleursProduit? couleursProduit,
    Utilisateur? utilisateur,
  }) {
    return Commande(
      idCommande: idCommande ?? this.idCommande,
      quantite: quantite ?? this.quantite,
      produits: produits ?? this.produits,
      date: date ?? this.date,
      panier: panier ?? this.panier,
      tailleProduit: tailleProduit ?? this.tailleProduit,
      couleursProduit: couleursProduit ?? this.couleursProduit,
      utilisateur: utilisateur ?? this.utilisateur,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCommande': idCommande,
      'quantite': quantite,
      'produits': produits?.toMap(),
      'date': date,
      'panier': panier?.toMap(),
      'tailleProduit': tailleProduit?.toMap(),
      'couleursProduit': couleursProduit?.toMap(),
      'utilisateur': utilisateur?.toMap(),
    };
  }

  factory Commande.fromMap(Map<String, dynamic> map) {
    return Commande(
      idCommande: map['idCommande'],
      quantite: map['quantite'],
      produits: Produit.fromMap(map['produits']),
      date: map['date'],
      panier: Panier.fromMap(map['panier']),
      tailleProduit: TailleProduit.fromMap(map['tailleProduit']),
      couleursProduit: CouleursProduit.fromMap(map['couleursProduit']),
      utilisateur: Utilisateur.fromMap(map['utilisateur']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Commande.fromJson(String source) =>
      Commande.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Commande(idCommande: $idCommande, quantite: $quantite, produits: $produits, date:$date panier: $panier, tailleProduit: $tailleProduit, couleursProduit: $couleursProduit, utilisateur: $utilisateur)';
  }

  @override
  bool operator ==(covariant Commande other) {
    if (identical(this, other)) return true;

    return other.idCommande == idCommande &&
        other.quantite == quantite &&
        other.produits == produits &&
        other.date == date &&
        other.panier == panier &&
        other.tailleProduit == tailleProduit &&
        other.couleursProduit == couleursProduit &&
        other.utilisateur == utilisateur;
  }

  @override
  int get hashCode {
    return idCommande.hashCode ^
        quantite.hashCode ^
        produits.hashCode ^
        date.hashCode ^
        panier.hashCode ^
        tailleProduit.hashCode ^
        couleursProduit.hashCode ^
        utilisateur.hashCode;
  }
}
