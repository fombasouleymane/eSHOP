import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';

import 'package:art_eshop/desktop/model/admin_Entity.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:http/http.dart' as http;

class AdminService {
  late Admin currentAdmin;
 Future<http.Response> enregistrerAmin(
      Admin admin, File imageFile) async {
    try {
      final url = Uri.parse('http://localhost:8080/admin/add');

      var request = http.MultipartRequest('POST', url);
      request.fields["admin"] = jsonEncode({
        'nom': admin.nom,
        'photo': "",
        'prenom': admin.prenom,
        'email': admin.email,
        'password': admin.password,
        // 'region': admin.region,
        'telephone': admin.telephone,
        // 'entreprise': admin.entreprise,
        'sexe': admin.sexe,
        // 'description': admin.description,
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

  // ::::::::::::::::::::::::::
  Future<http.Response> ajouterAdmin(Admin admin, Uint8List imageFile,
      String imageFileName, String mimeType) async {
    try {
      final url = Uri.parse('http://localhost:8080/admin/add');
      debugPrint(url.toString());
      var request = http.MultipartRequest('POST', url);
      request.fields["admin"] = jsonEncode({
        'photo': imageFileName,
        'nom': admin.nom,
        'prenom': admin.prenom,
        'email': admin.email,
        'password': admin.password,
        'telephone': admin.telephone,
        'sexe': admin.sexe,
      });
      // String? mimeType = lookupMimeType(imageFileName);
      debugPrint('-----type --${mimeType}');
      // Utilisez 'mime' pour détecter le type de contenu
      var image = http.MultipartFile.fromBytes(
        'photo',
        imageFile,
        filename:
            "$imageFileName.${mimeType.substring(mimeType.lastIndexOf("/") + 1)}",
        contentType:
            MediaType.parse(mimeType), // Spécifiez le type de contenu détecté
      );

      request.files.add(image);

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        // L'enregistrement a réussi
        // final prefs = await SharedPreferences.getInstance();
        
        debugPrint(response.body);
        currentAdmin = Admin.fromMap(jsonDecode(response.body));
        print('Artisan enregistré avec succès');
      } else {
        // Gérer les erreurs de réponse HTTP
        print(
            'Erreur lors de l\'enregistrement de l\'admin. Statut de réponse : ${response.statusCode}');
      }

      return response;
    } catch (e) {
      // Gérer les exceptions
      print('Erreur lors de l\'enregistrement de admin : $e');
      // ignore: null_check_always_fails
      rethrow;
    }
  }

// ::::::::::::::::::::::::;connexion::::::::::::::::::::::::
  Future<Map<String, dynamic>> verifyAdmin(
      String email, String password) async {
    try {
      // Créez l'URI pour la vérification de l'utilisateur avec les paramètres dans l'URL (GET)
      var uri = Uri.parse(
          "http://localhost:8080/admin/connexion?email=$email&password=$password");
      debugPrint("$uri");
      // Envoie la requête GET
      var response = await http.post(uri);

      // Vérifie le code de statut de la réponse
      if (response.statusCode == 200) {
        debugPrint("${response.statusCode}");
        debugPrint(response.body);
        var currentAdmin = response;

        // Succès : Utilisateur existe et informations correctes
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        debugPrint(" existe et informations correctes");
        // Échec : Utilisateur existe, mais informations incorrectes
        throw Exception("error");
      } else {
        // Autres cas de code de statut (gestion d'erreur)
        throw Exception(
            'Erreur lors de la vérification de l\'utilisateur. Code de statut : ${response.body}');
      }
    } catch (error) {
      // Gestion des erreurs générales (par exemple, perte de connexion)
      throw Exception('Une erreur s\'est produite : $error');
    }
  }
}
