import 'dart:convert';

import 'package:art_eshop/desktop/model/category_avec_produit.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategorieService {
  // :::::::::::::::::::::::::methode pour ajouter une category:::::::::::::::;
  Future<http.Response> add(
    Categories categories,
  ) async {
    try {
      // Créez l'URI
      var uri = Uri.parse("http://localhost:8080/categories/add");

      // En-têtes
      Map<String, String> headers = {"Content-Type": "application/json"};

      // Corps de la requête
      Map data = {
        'nom': categories.nom,
      };

      // Convertit les données en JSON
      var body = json.encode(data);

      // Envoie la requête POST
      var response = await http.post(uri, headers: headers, body: body);
      debugPrint("je suis");
      debugPrint(body);

      // Vérifie le code de statut de la réponse
      if (response.statusCode == 200) {
        return response;
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

  // ::::::::::::::::::::methode pour afficher les categories::::::::::::::::::
  Future<List<Categories>> getAllCategories() async {
    try {
      // Définition de l'URI pour la requête HTTP GET
      var uri = Uri.parse("http://10.0.2.2:8080/categories/list");

      // Envoi de la requête HTTP GET et attente de la réponse
      var response = await http.get(uri);

      // Vérification du code de statut de la réponse
      if (response.statusCode == 200) {
        // Si le code de statut est 200 (OK), on décode la réponse JSON
        List<dynamic> categoriesJson = jsonDecode(response.body);
        debugPrint(response.body);

        // On transforme les données JSON en une liste d'objets Categories
        List<Categories> categories = categoriesJson
            .map((categoryJson) => Categories.fromMap(categoryJson))
            .toList();

        // On renvoie la liste des catégories récupérées
        print('-----category mobil---${categories}');
        return categories;
      } else {
        // Si le code de statut est différent de 200, on lance une exception
        throw Exception(
            'Erreur lors de la récupération des catégories. Code de statut : ${response.statusCode}');
      }
    } catch (error) {
      // Capture et gestion des erreurs potentielles, y compris les erreurs réseau
      throw Exception(
          'Une erreur s\'est produite lors de la récupération des catégories : $error');
    }
  }

  // ::::::::::::::::::::::;category:admi
  Future<List<CategorieWithProduit>> getAllCategoriesadmin() async {
    String url = "";
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      url = "http://localhost:8080/categories/listCategorie";
    } else {
      url = "http://10.0.2.2:8080/categories/listCategorie";
    }
    try {
      // Définition de l'URI pour la requête HTTP GET
      // var uri = Uri.parse("http://localhost:8080/categories/listCategorie");

      // Envoi de la requête HTTP GET et attente de la réponse
      final response = await http.get(Uri.parse(url)
          // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
          );

      // Vérification du code de statut de la réponse
      if (response.statusCode == 200) {
        // Si le code de statut est 200 (OK), on décode la réponse JSON
        List<dynamic> categoriesJson = jsonDecode(response.body);
        debugPrint(response.body);

        // On transforme les données JSON en une liste d'objets Categories
        List<CategorieWithProduit> categories = categoriesJson
            .map((categoryJson) => CategorieWithProduit.fromMap(categoryJson))
            .toList();

        // On renvoie la liste des catégories récupérées
        print(categories);
        return categories;
      } else {
        // Si le code de statut est différent de 200, on lance une exception
        throw Exception(
            'Erreur lors de la récupération des catégories. Code de statut : ${response.statusCode}');
      }
    } catch (error) {
      // Capture et gestion des erreurs potentielles, y compris les erreurs réseau
      throw Exception(
          'Une erreur s\'est produite lors de la récupération des catégories : $error');
    }
  }

  // :::::::::::::;;supprimer un categories
  Future<String> supprrimerCategorie(
    int idCategories,
  ) async {
    String categorySupprimer = "";
    final url = Uri.parse(
        'http://localhost:8080/categories/supprimer/$idCategories'); // Remplacez par votre URL

    try {
      final response = await http.get(
        url,
        // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
      );

      print("-------body ${response.body}");

      if (response.statusCode == 200) {
        print("-------complet ${response.body}");
        // Si la requête est réussie, décoder la réponse JSON
        // produit = Produit.fromMap(jsonDecode(response.body));
        
        return categorySupprimer;
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      print(e);
      throw Exception('Échec de la connexion : $e');
    }
  }
}
