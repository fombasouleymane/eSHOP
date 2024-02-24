import 'dart:convert';
import 'dart:io';

import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/commande_Entity.dart';
import 'package:art_eshop/mobil/models/couleur_Entity.dart';
import 'package:art_eshop/mobil/models/panier_Entirty.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProduitService {
  // Produit produit = Produit();

  int indexPage = 0;

  Future<http.Response> ajoutProduit(
    Produit produit,
    File imageFile,
    List<TailleProduit> tailleProduit,
    List<CouleursProduit> couleurProduit,
    Artisan artisan,
    Categories categories,
  ) async {
    try {
      final url = Uri.parse('http://10.0.2.2:8080/produit/add');

      var request = http.MultipartRequest('POST', url);
      request.fields["produit"] = jsonEncode({
        'nom': produit.nom,
        'photo': "",
        'categories': {
          'idCategorie': categories.idCategorie,
          'nom': categories.nom,
        },
        'prix': produit.prix,
        'quantite': produit.quantite,
        'culture': produit.culture,
        'description': produit.description,
        'artisans': artisan.toMap()
      });
      print(categories);
      request.fields['couleur'] =
          jsonEncode(couleurProduit.map((couleur) => couleur.toMap()).toList());
      print(jsonEncode(
          couleurProduit.map((couleur) => couleur.toMap()).toList()));
      print("------------------------------oll");
      ;
      request.fields["taille"] =
          jsonEncode(tailleProduit.map((e) => e.toMap()).toList());
      print(jsonEncode(tailleProduit.map((e) => e.toMap()).toList()));

      var image = await http.MultipartFile.fromPath('photo', imageFile.path);
      request.files.add(image);
      debugPrint(imageFile.path);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(
          streamedResponse); // Convertit le flux en une réponse

      if (response.statusCode == 200) {
        // L'enregistrement a réussi
        print('Produit ajouter avec succès');
      } else {
        // Gérer les erreurs de réponse HTTP
        print(
            'Erreur lors de l\'enregistrement du produit. Statut de réponse : ${response.body}');
        // artisantNonActive = Artisan.fromJson(jsonDecode(response.body));
      }

      return response;
    } catch (e) {
      // Gérer les exceptions
      print('Erreur lors de l\'enregistrement du produit : $e');
      // ignore: null_check_always_fails
      rethrow;
    }
  }
}

class ProduitProvider extends ChangeNotifier {
  MyDataProduit? data;
  List<Produit> produits = [];

  Future<List<Produit>> getDataProduits() async {
    String url;
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      url = 'http://localhost:8080/typeProduits/list';
    } else {
      url = 'http://10.0.2.2:8080/typeProduits/list';
    }
    try {
      // const apiUrl =
      //     ('http://localhost:8080/typeProduits/list'); // Remplacez par l'URL réelle de votre API

      final response = await http.get(Uri.parse(url));

      // Vérifier si la requête a réussi (code d'état 200)
      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body);

        List<Produit> produits = [];

        for (var p in result) {
          print("=============/${p['produits']}");

          produits.add(Produit.fromMap(p['produits']));
        }

        notifyListeners();
        return produits;
      } else {
        // Si la requête n'a pas réussi, afficher le code d'erreur et le message
        print('ggggggg');
        throw Exception('error${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
  // ::::::::::::::;;produitComplet

  Future<Map<String, dynamic>> fetchProduitInformation(int idProduit) async {
    String url;
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      url = 'http://localhost:8080/produit/produitList/$idProduit';
    } else {
      url = 'http://10.0.2.2:8080/produit/produitList/$idProduit';
    }
    // final url = Uri.parse(
    //     'http://localhost:8080/produit/produitList/$idProduit'); // Remplacez par votre URL

    try {
      final response = await http.post(Uri.parse(url)
          // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
          );

      if (response.statusCode == 200) {
        print("-------complet ${response.body}");
        // Si la requête est réussie, décoder la réponse JSON
        return json.decode(response.body);
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      throw Exception('Échec de la connexion : $e');
    }
  }

  // :::::::::::::::::::::::::::::::::::::::::::::;;;;;
  Future<Commande> ajouterCommande(Commande commande) async {
    try {
      final url = Uri.parse('http://10.0.2.2:8080/produit/ajouteCommande');
      final reponse = await http.post(url,
          headers: <String, String>{
            "Content-Type": "application/json ; charset=UTF-8"
          },
          body: jsonEncode(commande.toMap()));
      if (reponse.statusCode == 200) {
        // L'enregistrement a réussi
        print("ajout avec success");
        return Commande.fromMap(jsonDecode(reponse.body));
      } else {
        throw Exception("-------error ici -----${reponse.body}-------");
      }
    } catch (e) {
      // Gérer les exceptions
      print('Erreur lors de l\'ajout de la commande : $e');
      rethrow;
    }
  }

// ::::::::::methode pour publier un produit
  Future<Produit> pubilerProduit(int idProduit) async {
    Produit produit = Produit();
    final url = Uri.parse(
        'http://localhost:8080/produit/publier/$idProduit'); // Remplacez par votre URL

    try {
      final response = await http.post(
        url,
        // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
      );

      if (response.statusCode == 200) {
        print("-------complet ${response.body}");
        // Si la requête est réussie, décoder la réponse JSON
        produit = Produit.fromMap(jsonDecode(response.body));
        return produit;
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

// ::::::::::methode pour rejeter un produit
  Future<String> rejeterProduit(int idProduit) async {
    String produit = "";
    final url = Uri.parse(
        'http://localhost:8080/produit/rejeter/$idProduit'); // Remplacez par votre URL

    try {
      final response = await http.delete(
        url,
        // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
      );

      if (response.statusCode == 200) {
        print("-------complet ${response.body}");
        // Si la requête est réussie, décoder la réponse JSON
        // produit = Produit.fromMap(jsonDecode(response.body));
        return "success";
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici
        print(response.body);
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      print(e.toString());
      throw Exception('Échec de la connexion : $e');
    }
  }

  // ::::::::::::::::::::::::::liste produit publier vers mobile
  Future<List<Produit>> getAllProduitPublier() async {
    try {
      // Définition de l'URI pour la requête HTTP GET
      var uri =
          Uri.parse("http://10.0.2.2:8080/produit/listproduitProduitPublier");

      // Envoi de la requête HTTP GET et attente de la réponse
      var response = await http.get(uri);

      // Vérification du code de statut de la réponse
      if (response.statusCode == 200) {
        // Si le code de statut est 200 (OK), on décode la réponse JSON
        List<dynamic> produitJson = jsonDecode(response.body);
        debugPrint(response.body);

        // On transforme les données JSON en une liste d'objets Categories
        List<Produit> produit = produitJson
            .map((produitJson) => Produit.fromMap(produitJson))
            .toList();

        // On renvoie la liste des catégories récupérées
        print('-----produit mobil---${produit}');
        notifyListeners();
        return produit;
      } else {
        // Si le code de statut est différent de 200, on lance une exception
        throw Exception(
            'Erreur lors de la récupération des publication. Code de statut : ${response.statusCode}');
      }
    } catch (error) {
      // Capture et gestion des erreurs potentielles, y compris les erreurs réseau
      throw Exception(
          'Une erreur s\'est produite lors de la récupération des publications : $error');
    }
  }

  // ::::::::::::::::::::::::::recuperer la list de produit similaires
  Future<List<Produit>> listProduitSimilaire(
      int idCategorie, String nomProduit) async {
    // List<Produit> listProduitSimil;
    String url;
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      url =
          'http://localhost:8080/produit/produitSimilaire/$idCategorie/$nomProduit';
    } else {
      url =
          'http://10.0.2.2:8080/produit/produitSimilaire/$idCategorie/$nomProduit';
    }

    try {
      final response = await http.get(Uri.parse(url)
          // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
          );

      if (response.statusCode == 200) {
        print("-------complet ${response.body}");
        List<dynamic> listProduitJson = jsonDecode(response.body);
        debugPrint(response.body);

        List<Produit> produits = listProduitJson
            .map((listProduitJson) => Produit.fromMap(listProduitJson))
            .toList();
        // notifyListeners();
        return produits;
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici

        print(response.body);
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      print(e.toString());
      throw Exception('Échec de la recuperation : $e');
    }
  }

  // :::::::::::::::::::::;la liste de produit par artisan
  Future<List<Produit>> artisanlistProduit(int idArtisan) async {
    // List<Produit> listProduitSimil;
    String url;
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      url = 'http://localhost:8080/produit/artisanListproduit/$idArtisan';
    } else {
      url = 'http://10.0.2.2:8080/produit/artisanListproduit/$idArtisan';
    }

    try {
      final response = await http.get(Uri.parse(url)
          // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
          );

      if (response.statusCode == 200) {
        print("-------complet ${response.body}");
        List<dynamic> listProduitJson = jsonDecode(response.body);
        debugPrint(response.body);

        List<Produit> produits = listProduitJson
            .map((listProduitJson) => Produit.fromMap(listProduitJson))
            .toList();
        // notifyListeners();
        return produits;
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici

        print(response.body);
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      print(e.toString());
      throw Exception('Échec de la recuperation : $e');
    }
  }

  // :::::::::::::::::::::::list commande pour utilisateur
  Future<List<Commande>> listCommandeUser(int idUtilisateur) async {
    List<Commande> listCommandes;
    try {
      var apiUrl =
          ('http://10.0.2.2:8080/produit/commandeParUtilisateur/$idUtilisateur');
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(response.body);
        print("-------complet ${response.body}");

        listCommandes = result.map((json) => Commande.fromMap(json)).toList();
        return listCommandes;
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici
        print(response.body);
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      print(e.toString());
      throw Exception('Échec de la connexion : $e');
    }
  }

  // :::::::::::::::::::;;achat produit
  Future<Produit> achatProduit(int idProduit, double quantite) async {
    Produit produit = Produit();
    final url = Uri.parse(
        'http://10.0.2.2:8080/produit/achat/$idProduit/$quantite'); // Remplacez par votre URL

    try {
      final response = await http.get(
        url,
        // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
      );

      print("-------body ${response.body}");

      if (response.statusCode == 200) {
        print("-------complet ${response.body}");
        // Si la requête est réussie, décoder la réponse JSON
        produit = Produit.fromMap(jsonDecode(response.body));
        return produit;
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

  // :::::::::::::::::::::;;;;ventes
  Future<List<Commande>> ventes(int idArtisan) async {
    // List<Produit> listProduitSimil;
    String url;
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      url = 'http://localhost:8080/produit/ventes/$idArtisan';
    } else {
      url = 'http://10.0.2.2:8080/produit/ventes/$idArtisan';
    }

    try {
      final response = await http.get(Uri.parse(url)
          // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
          );

      if (response.statusCode == 200) {
        print("-------complet ${response.body}------------ventes--------");
        List<dynamic> listProduitJson = jsonDecode(response.body);
        debugPrint(response.body);

        List<Commande> produits = listProduitJson
            .map((listProduitJson) => Commande.fromMap(listProduitJson))
            .toList();
        print("-------complet ${listProduitJson}------------list--------");

        // notifyListeners();
        return produits;
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici

        print(response.body);
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      print(e.toString());
      throw Exception('Échec de la recuperation : $e');
    }
  }

  // :::::::::::::::::::::::::produit par categorie
  Future<List<Produit>> produitParCategory(int idCategorie) async {
    // List<Produit> listProduitSimil;
    String url;
    if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
      url = 'http://localhost:8080/produit/produitParCategori/$idCategorie';
    } else {
      url = 'http://10.0.2.2:8080/produit/produitParCategori/$idCategorie';
    }

    try {
      final response = await http.get(Uri.parse(url)
          // Ici, vous pouvez ajouter des en-têtes ou un corps de requête si nécessaire
          );

      if (response.statusCode == 200) {
        print("-------complet ${response.body}------------ventes--------");
        List<dynamic> listProduitJson = jsonDecode(response.body);
        debugPrint(response.body);

        List<Produit> produits = listProduitJson
            .map((listProduitJson) => Produit.fromMap(listProduitJson))
            .toList();
        print("-------complet ${listProduitJson}------------list--------");

        // notifyListeners();
        return produits;
      } else {
        // Si la requête a échoué, vous pouvez gérer l'erreur ici

        print(response.body);
        throw Exception('Échec de la requête : ${response.body}');
      }
    } catch (e) {
      // En cas d'erreur lors de la connexion, capturez l'exception ici
      print(e.toString());
      throw Exception('Échec de la recuperation : $e');
    }
  }

  // :::::::::::::::::::::supprimer un produit par un id
  Future<String> supprrimer(
    int idProduit,
  ) async {
    String produitSupprimer = "";
    final url = Uri.parse(
        'http://10.0.2.2:8080/produit/supprimer/$idProduit'); // Remplacez par votre URL

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
        return produitSupprimer;
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
