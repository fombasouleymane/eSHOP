import 'dart:convert';

import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArtisanSharedPreference {
  late Utilisateur currentUtilisateur;
  late Artisan currentArtisan;
  late Artisan artisanConnect;
  Future<Artisan?> getArtisanFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? artisanJson = prefs.getString("currentArtisan");

    if (artisanJson != null) {
      Map<String, dynamic> artisanMap = jsonDecode(artisanJson);
      artisanConnect = Artisan.fromMap(artisanMap);
      print(
          "--------------------------get art shared preferences------------------------");
      print(Artisan.fromMap(artisanMap));
      return artisanConnect;
    } else {
      return null;
    }
  }

// ::::::::::::::::::::::::::::::::::::::::add artisan
  Future<String> addArtisanToSharedPreference(Artisan artisan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("currentArtisan", jsonEncode(artisan.toMap()));
    print("--------------shqred");
    print(jsonEncode(artisan.toMap()));
    return "Success";
  }

  // :::::::::::::::::::::::::::::supprimmer artisan
  Future<String> supprimerArtisanToSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    return "Success";
  }

  // :::::::::::::::::::::::::;utilisateur add

  Future<String> addUtilisateurToSharedPreference(
      Utilisateur utilisateur) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        "currentUtilisateur", jsonEncode(utilisateur.toMap()));
    print('je suis user ${utilisateur}');
    return "Success";
  }

  // ::::::::::::::::::::::::::get user
  Future<Utilisateur?> getUserFromSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? utilisateurJson = prefs.getString("currentUtilisateur");

    if (utilisateurJson != null) {
      Map<String, dynamic> artisanMap = jsonDecode(utilisateurJson);
      return Utilisateur.fromMap(artisanMap);
    } else {
      return null;
    }
  }

// ::::::::::::::::::::::::::::::supprimer ou deconnecter
  Future<String> supprimerUserFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("currentUtilisateur");
    currentUtilisateur = Utilisateur();
    return "succeeded";
  }
}
