// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';

// ignore_for_file: file_names

class Produit {
  int? idProduit;
  String? nom;
  int? idCategorie;
  double? prix;
  double? quantite;
  String? description;
  String? date;
  String? culture;
  String? photo;
  bool? publier;
  bool? acheter;
  bool? effacerProduit;
  Artisan? artisans;
  Categories? categories;
  Produit({
    this.idProduit,
    this.nom,
    this.idCategorie,
    this.prix,
    this.quantite,
    this.description,
    this.date,
    this.culture,
    this.photo,
    this.publier,
    this.acheter,
    this.effacerProduit,
    this.artisans,
    this.categories,
  });

  Produit copyWith({
    int? idProduit,
    String? nom,
    int? idCategorie,
    double? prix,
    double? quantite,
    String? description,
    String? date,
    String? culture,
    String? photo,
    bool? publier,
    bool? acheter,
    bool? effacerProduit,
    Artisan? artisans,
    Categories? categories,
  }) {
    return Produit(
      idProduit: idProduit ?? this.idProduit,
      nom: nom ?? this.nom,
      idCategorie: idCategorie ?? this.idCategorie,
      prix: prix ?? this.prix,
      quantite: quantite ?? this.quantite,
      description: description ?? this.description,
      date: date ?? this.date,
      culture: culture ?? this.culture,
      photo: photo ?? this.photo,
      publier: publier ?? this.publier,
      acheter: acheter ?? this.acheter,
      effacerProduit: effacerProduit ?? this.effacerProduit,
      artisans: artisans ?? this.artisans,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idProduit': idProduit,
      'nom': nom,
      'idCategorie': idCategorie,
      'prix': prix,
      'quantite': quantite,
      'description': description,
      'date': date,
      'culture': culture,
      'photo': photo,
      'publier': publier,
      'acheter': acheter,
      'effacerProduit': effacerProduit,
      'artisans': artisans?.toMap(),
      'categories': categories?.toMap(),
    };
  }

  factory Produit.fromMap(Map<String, dynamic> map) {
    return Produit(
      idProduit: map['idProduit'],
      nom: map['nom'],
      idCategorie: map['idCategorie'],
      prix: map['prix'],
      quantite: map['quantite'],
      description: map['description'],
      date: map['date'],
      culture: map['culture'],
      photo: map['photo'],
      publier: map['publier'],
      acheter: map['acheter'],
      effacerProduit: map['effacerProduit'],
      artisans: Artisan.fromMap(map['artisans']),
      categories: Categories.fromMap(map['categories']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Produit.fromJson(String source) =>
      Produit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Produit(idProduit: $idProduit, nom: $nom, idCategorie: $idCategorie, prix: $prix, quantite: $quantite, description: $description, date: $date, culture: $culture, photo: $photo, publier: $publier, acheter: $acheter, artisans: $artisans, categories: $categories)';
  }

  @override
  bool operator ==(covariant Produit other) {
    if (identical(this, other)) return true;

    return other.idProduit == idProduit &&
        other.nom == nom &&
        other.idCategorie == idCategorie &&
        other.prix == prix &&
        other.quantite == quantite &&
        other.description == description &&
        other.date == date &&
        other.culture == culture &&
        other.photo == photo &&
        other.publier == publier &&
        other.acheter == acheter &&
        other.effacerProduit == effacerProduit &&
        other.artisans == artisans &&
        other.categories == categories;
  }

  @override
  int get hashCode {
    return idProduit.hashCode ^
        nom.hashCode ^
        idCategorie.hashCode ^
        prix.hashCode ^
        quantite.hashCode ^
        description.hashCode ^
        date.hashCode ^
        culture.hashCode ^
        photo.hashCode ^
        publier.hashCode ^
        acheter.hashCode ^
        effacerProduit.hashCode ^
        artisans.hashCode ^
        categories.hashCode;
  }
}

// ::::::::::::::::::::
class MyDataProduit {
  List<Produit> items;

  MyDataProduit({required this.items});

  factory MyDataProduit.fromJson(List<dynamic> json) {
    List<Produit> items = json.map((item) => Produit.fromJson(item)).toList();
    return MyDataProduit(items: items);
  }
}
