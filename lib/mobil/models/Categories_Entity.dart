// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Categories {
  int? idCategorie;
  String? nom;

  Categories({
    this.idCategorie,
    this.nom,
  });

  Categories copyWith({
    int? idCategorie,
    String? nom,
  }) {
    return Categories(
      idCategorie: idCategorie ?? this.idCategorie,
      nom: nom ?? this.nom,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCategorie': idCategorie,
      'nom': nom,
    };
  }

  factory Categories.fromMap(Map<String, dynamic> map) {
    return Categories(
      idCategorie: map['idCategorie'],
      nom: map['nom'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Categories.fromJson(String source) =>
      Categories.fromMap(json.decode(source));

  @override
  String toString() => 'Categories(idCategorie: $idCategorie, nom: $nom)';

  @override
  bool operator ==(covariant Categories other) {
    if (identical(this, other)) return true;

    return other.idCategorie == idCategorie && other.nom == nom;
  }

  @override
  int get hashCode => idCategorie.hashCode ^ nom.hashCode;
}
