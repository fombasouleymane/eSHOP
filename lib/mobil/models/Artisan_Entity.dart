// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:art_eshop/desktop/model/admin_Entity.dart';

// ignore_for_file: file_names

class Artisan {
  int? idArtisans;
  String? photo;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? region;
  String? telephone;
  String? entreprise;
  String? sexe;
  String? description;
  bool? active;
  int? idAdmin;

  bool selected = false;
  Artisan({
    this.idArtisans,
    this.photo,
    this.nom,
    this.prenom,
    this.email,
    this.password,
    this.region,
    this.telephone,
    this.entreprise,
    this.sexe,
    this.description,
    this.active,
    this.idAdmin,
    //  this.selected,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idArtisans': idArtisans,
      'photo': photo,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
      'region': region,
      'telephone': telephone,
      'entreprise': entreprise,
      'sexe': sexe,
      'description': description,
      'active': active,
      'idAdmin': idAdmin,
    };
  }

  factory Artisan.fromMap(Map<String, dynamic> map) {
    return Artisan(
      idArtisans: map['idArtisans'],
      photo: map['photo'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      password: map['password'],
      region: map['region'],
      telephone: map['telephone'],
      entreprise: map['entreprise'],
      sexe: map['sexe'],
      description: map['description'],
      active: map['active'],
      idAdmin: map['idAdmin'],
      // selected: map['selected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Artisan.fromJson(String source) =>
      Artisan.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Artisan(idArtisan: $idArtisans, photo: $photo, nom: $nom, prenom: $prenom, email: $email, password: $password, region: $region, telephone: $telephone, entreprise: $entreprise, sexe: $sexe, description: $description, active: $active, selected: $selected,idAdmin: $idAdmin)';
  }

  @override
  bool operator ==(covariant Artisan other) {
    if (identical(this, other)) return true;

    return other.idArtisans == idArtisans &&
        other.photo == photo &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.email == email &&
        other.password == password &&
        other.region == region &&
        other.telephone == telephone &&
        other.entreprise == entreprise &&
        other.sexe == sexe &&
        other.description == description &&
        other.active == active &&
        other.selected == selected &&
        other.idAdmin==idAdmin;
  }

  @override
  int get hashCode {
    return idArtisans.hashCode ^
        photo.hashCode ^
        nom.hashCode ^
        prenom.hashCode ^
        email.hashCode ^
        password.hashCode ^
        region.hashCode ^
        telephone.hashCode ^
        entreprise.hashCode ^
        sexe.hashCode ^
        description.hashCode ^
        active.hashCode ^
        selected.hashCode^
        idAdmin.hashCode;
  }
}

class MyData {
  List<Artisan> items;

  MyData({required this.items});

  factory MyData.fromJson(List<dynamic> json) {
    List<Artisan> items = json.map((item) => Artisan.fromJson(item)).toList();
    return MyData(items: items);
  }
}
