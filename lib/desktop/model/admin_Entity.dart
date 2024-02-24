// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// ignore_for_file: file_names

class Admin {
  int? idAdmin;
  String? photo;
  String? nom;
  String? prenom;
  String? email;
  String? password;
  String? telephone;
  String? sexe;

  Admin({
    this.idAdmin,
    this.photo,
    this.nom,
    this.prenom,
    this.email,
    this.password,
    this.telephone,
    this.sexe,
  });

  Admin copyWith({
    int? idAdmin,
    String? photo,
    String? nom,
    String? prenom,
    String? email,
    String? password,
    String? telephone,
    String? sexe,
  }) {
    return Admin(
      idAdmin: idAdmin ?? this.idAdmin,
      photo: photo ?? this.photo,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      email: email ?? this.email,
      password: password ?? this.password,
      telephone: telephone ?? this.telephone,
      sexe: sexe ?? this.sexe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idAdmin': idAdmin,
      'photo': photo,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
      'telephone': telephone,
      'sexe': sexe,
    };
  }

  factory Admin.fromMap(Map<String, dynamic> map) {
    return Admin(
      idAdmin: map['idAdmin'],
      photo: map['photo'],
      nom: map['nom'],
      prenom: map['prenom'],
      email: map['email'],
      password: map['password'],
      telephone: map['telephone'],
      sexe: map['sexe'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Admin.fromJson(String source) => Admin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Admin(idAdmin: $idAdmin, photo: $photo, nom: $nom, prenom: $prenom, email: $email, password: $password, telephone: $telephone, sexe: $sexe, )';
  }

  @override
  bool operator ==(covariant Admin other) {
    if (identical(this, other)) return true;

    return other.idAdmin == idAdmin &&
        other.photo == photo &&
        other.nom == nom &&
        other.prenom == prenom &&
        other.email == email &&
        other.password == password &&
        other.sexe == sexe &&
        other.telephone == telephone;
  }

  @override
  int get hashCode {
    return idAdmin.hashCode ^
        photo.hashCode ^
        nom.hashCode ^
        prenom.hashCode ^
        email.hashCode ^
        password.hashCode ^
        sexe.hashCode ^
        telephone.hashCode;
  }
}
