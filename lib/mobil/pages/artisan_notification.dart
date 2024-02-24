import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/notification_Entity.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:art_eshop/mobil/services/notification_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtisanNotification extends StatefulWidget {
  const ArtisanNotification({super.key});

  @override
  State<ArtisanNotification> createState() => _ArtisanNotificationState();
}

class _ArtisanNotificationState extends State<ArtisanNotification> {
  NotificationService notificationService = NotificationService();
  List<NotificationClass> notifications = [];
  Artisan artisan = Artisan();
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();

  @override
  void initState() {
    fetchNotification();

    super.initState();
  }

  Future<void> fetchNotification() async {
    artisanSharedPreference
        .getArtisanFromSharedPreference()
        .then((value) async {
      if (value != null) {
        artisan = value;
        await notificationService
            .listNotificationArtisan(artisan.idArtisans!)
            .then((value) {
          // if (value != null) {}
          print('-----list notification pour artisan--${value}');
          setState(() {
            notifications = value;
          });
        }).catchError((err) {
          print(
              'Erreur lors de la récupération des notification de l\'artisan : $err');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Couleurs.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const ArtisanProfil()));
          },
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            color: Couleurs.blanc,
            size: 30,
          ),
        ),
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            Container(
              child: Text(
                "Notifications",
                style: TextStyle(
                    color: Couleurs.blanc,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
            itemCount: notifications.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, index) {
              final notification = notifications[index];
              print(
                  '-----------------not----${notification.commandes?.couleursProduit}');
              return InkWell(
                  highlightColor: Couleurs.orange.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                  child: Column(
                    children: [
                      Center(
                          child: Container(
                        decoration: BoxDecoration(
                            // border: Border.all(width: 1),
                            // color: const Color.fromARGB(255, 46, 38, 38),
                            borderRadius: BorderRadius.circular(5)),
                        // width: 200,

                        child: Text(
                          "${notification.date}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )),
                      Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(5),
                        // height: 20,
                        // width: 100,
                        decoration: BoxDecoration(
                          color: Couleurs.blanc,
                          border: Border.all(width: 1, color: Couleurs.gri),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            Text("${notification.description}"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Color(int.parse(
                                                notification.commandes!.couleursProduit!.libelle
                                                    .substring(1, 7),
                                                radix: 16) +
                                            0x80000000),
                                        // shape: BoxShape.circle,
                                        border: Border.all(
                                            width: 1, color: Couleurs.gri))),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    "${notification.commandes!.tailleProduit!.libelle}",
                                    style: TextStyle(color: Couleurs.orange),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      // Container(
                      //   child: Row(
                      //     children: [],
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ));
            },
          ))
        ]),
      ),
    );
  }
}
