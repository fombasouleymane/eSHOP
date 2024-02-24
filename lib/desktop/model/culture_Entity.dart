// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:art_eshop/desktop/model/admin_Entity.dart';

class CultureEntity {
  int? idCulture;
  String? nom;
  String? description;
  String? regionCulturel;
  String? photo;
  String? ethnie;
  Admin? admin;
  CultureEntity({
    this.idCulture,
    this.nom,
    this.description,
    this.regionCulturel,
    this.photo,
    this.ethnie,
    this.admin,
  });

  CultureEntity copyWith({
    int? idCulture,
    String? nom,
    String? description,
    String? regionCulturel,
    String? photo,
    String? ethnie,
    Admin? admin,
  }) {
    return CultureEntity(
      idCulture: idCulture ?? this.idCulture,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      regionCulturel: regionCulturel ?? this.regionCulturel,
      photo: photo ?? this.photo,
      ethnie: ethnie ?? this.ethnie,
      admin: admin ?? this.admin,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCulture': idCulture,
      'nom': nom,
      'description': description,
      'regionCulturel': regionCulturel,
      'photo': photo,
      'ethnie': ethnie,
      'admin': admin?.toMap(),
    };
  }

  factory CultureEntity.fromMap(Map<String, dynamic> map) {
    return CultureEntity(
      idCulture: map['idCulture'],
      nom: map['nom'],
      description: map['description'],
      regionCulturel: map['regionCulturel'],
      photo: map['photo'],
      ethnie: map['ethnie'],
      admin: Admin.fromMap(map['admin']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CultureEntity.fromJson(String source) => CultureEntity.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Culture(idCulture: $idCulture, nom: $nom, description: $description, regionCulturel: $regionCulturel, photo: $photo, ethnie: $ethnie, admin: $admin)';
  }

  @override
  bool operator ==(covariant CultureEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.idCulture == idCulture &&
      other.nom == nom &&
      other.description == description &&
      other.regionCulturel == regionCulturel &&
      other.photo == photo &&
      other.ethnie == ethnie &&
      other.admin == admin;
  }

  @override
  int get hashCode {
    return idCulture.hashCode ^
      nom.hashCode ^
      description.hashCode ^
      regionCulturel.hashCode ^
      photo.hashCode ^
      ethnie.hashCode ^
      admin.hashCode;
  }
}
