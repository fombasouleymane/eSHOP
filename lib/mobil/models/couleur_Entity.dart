// ignore_for_file: public_member_api_docs, sort_constructors_first, camel_case_types
import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: file_names

class CouleursProduit {
  final int? idCouleur;
  final String libelle;
  CouleursProduit({
    this.idCouleur,
    required this.libelle,
  });

  CouleursProduit copyWith({
    int? idCouleur,
    String? libelle,
  }) {
    return CouleursProduit(
      idCouleur: idCouleur ?? this.idCouleur,
      libelle: libelle ?? this.libelle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idCouleur': idCouleur,
      'libelle': libelle,
    };
  }

  factory CouleursProduit.fromMap(Map<String, dynamic> map) {
    return CouleursProduit(
      idCouleur: map['idCouleur'],
      libelle: map['libelle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CouleursProduit.fromJson(String source) =>
      CouleursProduit.fromMap(json.decode(source));

  @override
  String toString() => 'Couleurs(idCouleur: $idCouleur, libelle: $libelle)';

  @override
  bool operator ==(covariant CouleursProduit other) {
    if (identical(this, other)) return true;

    return other.idCouleur == idCouleur && other.libelle == libelle;
  }

  @override
  int get hashCode => idCouleur.hashCode ^ libelle.hashCode;

  Color getColorFromLabelle() {
    // Supposons que le libellé représente une couleur en hexadécimal
    // Vérifiez si le libellé est une couleur valide en hexadécimal
    if (libelle.isNotEmpty && libelle.length >= 6) {
      try {
        // Analyse le libellé en une couleur hexadécimale et la retourne
        return Color(
            int.parse(libelle.substring(1, 7), radix: 16) + 0xFF000000);
      } catch (e) {
        // En cas d'erreur lors de la conversion, retourne une couleur par défaut
        return Colors.grey; // Ou une autre couleur par défaut de votre choix
      }
    } else {
      // Si le libellé n'est pas une couleur valide, retourne une couleur par défaut
      return Colors.grey; // Ou une autre couleur par défaut de votre choix
    }
  }
}

extension HexColor on Color {
  // Prend en charge la chaîne au format RGB pour la convertir en entier
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
