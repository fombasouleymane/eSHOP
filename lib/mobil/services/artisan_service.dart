// ignore_for_file: unused_element

import 'dart:convert';
import 'dart:io';

import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ArtisantService extends ChangeNotifier {
  Artisan artisan = Artisan();
  bool isArtisan = false;
  int indexPage = 0;

  set artisanProv(bool value) {
    isArtisan = value;
    notifyListeners();
  }

  Future<http.Response> enregistrerArtisan(
      Artisan artisan, File imageFile) async {
    try {
      final url = Uri.parse('http://10.0.2.2:8080/artisan/create');

      var request = http.MultipartRequest('POST', url);
      request.fields["artisan"] = jsonEncode({
        'nom': artisan.nom,
        'photo': "",
        'prenom': artisan.prenom,
        'email': artisan.email,
        'password': artisan.password,
        'region': artisan.region,
        'telephone': artisan.telephone,
        'entreprise': artisan.entreprise,
        'sexe': artisan.sexe,
        'description': artisan.description,
      });

      var image = await http.MultipartFile.fromPath('photo', imageFile.path);
      request.files.add(image);
      debugPrint(imageFile.path);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(
          streamedResponse); // Convertit le flux en une réponse

      if (response.statusCode == 200) {
        // L'enregistrement a réussi
        print('Artisan enregistré avec succès');
      } else {
        // Gérer les erreurs de réponse HTTP
        print(
            'Erreur lors de l\'enregistrement de l\'artisan. Statut de réponse : ${response.body}');
        // artisantNonActive = Artisan.fromJson(jsonDecode(response.body));
      }

      return response;
    } catch (e) {
      // Gérer les exceptions
      print('Erreur lors de l\'enregistrement de l\'artisan : $e');
      // ignore: null_check_always_fails
      return null!;
    }
  }

  // ::::::::::::::::::;;;;;methode pour modifier:;;::::::::::::::;
  Future<http.Response> modifierArtisan(Artisan artisan, File imageFile) async {
    try {
      final url = Uri.parse('http://10.0.2.2:8080/artisan/create');

      var request = http.MultipartRequest('PUT', url);
      request.fields["artisan"] = jsonEncode({
        'nom': artisan.nom,
        'photo': "",
        'prenom': artisan.prenom,
        'email': artisan.email,
        'password': artisan.password,
        'region': artisan.region,
        'telephone': artisan.telephone,
        'entreprise': artisan.entreprise,
        'sexe': artisan.sexe,
      });

      var image = await http.MultipartFile.fromPath('photo', imageFile.path);
      request.files.add(image);
      debugPrint(imageFile.path);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(
          streamedResponse); // Convertit le flux en une réponse

      if (response.statusCode == 200) {
        // L'enregistrement a réussi
        print('Artisan enregistré avec succès');
      } else {
        // Gérer les erreurs de réponse HTTP
        print(
            'Erreur lors de l\'enregistrement de l\'artisan. Statut de réponse : ${response.body}');
        // artisantNonActive = Artisan.fromJson(jsonDecode(response.body));
      }

      return response;
    } catch (e) {
      // Gérer les exceptions
      print('Erreur lors de l\'enregistrement de l\'artisan : $e');
      // ignore: null_check_always_fails
      return null!;
    }
  }

  void changeIndex(int index, Artisan? art) {
    indexPage = index;
    if (art != null) {
      artisan = art;
    }
    notifyListeners();
  }

  // :::::::::::::::::::::::::::::;active un artisan

  Future<Artisan> activeOuDesactive(int idArtisans) async {
    try {
      // Créez l'URI
      var uri = Uri.parse("http://localhost:8080/artisan/active/$idArtisans");

      // En-têtes
      Map<String, String> headers = {"Content-Type": "application/json"};

      // Envoie la requête POST
      var response = await http.put(uri, headers: headers, body: null);
      debugPrint("je suis");
      debugPrint(response.body);

      // Vérifie le code de statut de la réponse
      if (response.statusCode == 200) {
        return Artisan.fromMap(jsonDecode(response.body));
      } else {
        // Échec : Gestion d'erreur en cas de code de statut non attendu
        throw Exception(
            'Erreur lors de la création de l\'utilisateur. Code de statut : ${response.body}');
      }
    } catch (error) {
      // Gestion des erreurs générales (par exemple, perte de connexion)
      throw Exception('Une erreur s\'est produite : $error');
    }
  }

  // :::::::::::::::::::::::::verifier artisan connection
  Future<Object> verifieConnexion(String email, String password) async {
    try {
      // Créez l'URI pour la vérification de l'utilisateur avec les paramètres dans l'URL (GET)
      var uri = Uri.parse(
          "http://10.0.2.2:8080/connexion/verifier?email=$email&password=$password");
      debugPrint("$uri");
      // Envoie la requête GET
      var response = await http.get(uri);

      // Vérifie le code de statut de la réponse
      if (response.statusCode == 200) {
        debugPrint("${response.statusCode}");
        debugPrint("----body---${response.body}");

        // Succès : Utilisateur existe et informations correctes
        var object = jsonDecode(response.body);
        print('----object --${object}');
        return object;
      } else {
        // Autres cas de code de statut (gestion d'erreur)
        throw Exception(
            'Erreur lors de la vérification de l\'utilisateur. Code de statut : ${response.body}');
      }
    } catch (error) {
      // Gestion des erreurs générales (par exemple, perte de connexion)
      throw Exception('Une erreur s\'est produite : ${error.toString()}');
    }
  }
}

class ArtisanProvider extends ChangeNotifier {
  MyData? data;
  List<Artisan> artisans = [];

  Future<List<Artisan>> getData() async {
    const apiUrl =
        ('http://localhost:8080/artisan/list'); // Remplacez par l'URL réelle de votre API

    final response = await http.get(Uri.parse(apiUrl));

    // Vérifier si la requête a réussi (code d'état 200)
    if (response.statusCode == 200) {
      List<dynamic> result = jsonDecode(response.body);
      print(result);

      artisans = result.map((json) => Artisan.fromMap(json)).toList();

      print(artisans.toString());
      notifyListeners();
      return artisans;
    } else {
      // Si la requête n'a pas réussi, afficher le code d'erreur et le message
      throw Exception('error');
    }
  }

  // ::::::::::::::::::::::::::nombre artisan
  Future<int> fetchArtisans() async {
    try {
      final response = await http.get(
        Uri.parse(
            'http://localhost:8080/artisan/nombre'), // Remplacez par votre URL correcte
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
}
