import 'dart:convert';

import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class UtilisateurService {
  Future<Utilisateur> saveUser(Utilisateur utilisateur) async {
    try {
      final url = Uri.parse('http://10.0.2.2:8080/user/add');

      final reponse = await http.post(url,
          headers: <String, String>{"Content-Type": "application/json"},
          body: jsonEncode(utilisateur.toMap()));
      print('type----dinamique${utilisateur.toMap()}');

      if (reponse.statusCode == 200) {
        // L'enregistrement a réussi
        print('utilisateur ajoutée  succès${reponse.body}');
        return Utilisateur.fromMap(jsonDecode(reponse.body));
      }else{
        throw Exception("error");
      }
    } catch (e) {
      // Gérer les exceptions
      print('Erreur lors de l\'ajout de l\'utilisateur : $e');
      throw Exception("error, $e");
    }
  }

  // :::::::::::::::::::::::::::::::nombre d'utilisateur
  Future<int> fetchUtilisateur() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://localhost:8080/user/nombre'), // Remplacez par votre URL correcte
      );

      if (response.statusCode == 200) {
        print(' le nombre ; ${response.body}');
        return int.parse(response.body);
      } else {
        throw Exception('Échec de la requête');
      }
    } catch (error) {
      throw Exception('error : $error');
    }
  }

  // methode authentification google:::::::::::::::::::::::::::::
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      debugPrint('L\'utilisateur a annulé la connexion Google');
      throw Exception('L\'utilisateur a annulé la connexion Google');
    }
  }
}
