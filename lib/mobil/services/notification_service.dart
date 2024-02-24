import 'dart:convert';

import 'package:art_eshop/mobil/models/notification_Entity.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  Future<List<NotificationClass>> listNotification() async {
    List<NotificationClass> notification;
    try {
      const apiUrl = ('http://localhost:8080/notification/list');
      final response = await http.get(Uri.parse(apiUrl));

      // Vérifier si la requête a réussi (code d'état 200)
      if (response.statusCode == 200) {
        print("-------${response.body}-------");
        List<dynamic> result = jsonDecode(response.body);
        print('---------------result ${result}---------');

        notification =
            result.map((json) => NotificationClass.fromMap(json)).toList();

        print('-------list-----${notification.toString()}');
        return notification;
      } else {
        throw Exception("nontification non trover : ${response.body}");
        // Si la requête n'a pas réussi, afficher le code d'erreur et le message
      }
    } catch (e) {
      print('Erreur lors de la recuperation des notification : ${e.toString()}');
      rethrow;
    }
  }

  // :::::::::::::::::::::::::::::::::::::::
  Future<List<NotificationClass>> listNotificationArtisan(int idArtisan) async {
    List<NotificationClass> listnotifications;
    try {
      var apiUrl =
          ('http://10.0.2.2:8080/notification/listParArtisan/$idArtisan');
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> result = jsonDecode(utf8.decode(response.bodyBytes));
        print("-------complet ${response.body}");

        listnotifications =
            result.map((json) => NotificationClass.fromMap(json)).toList();
        print("-------------------------------------");
        return listnotifications;
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
}
