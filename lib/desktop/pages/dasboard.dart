import 'package:art_eshop/mobil/models/commande_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/notification_Entity.dart';
import 'package:art_eshop/mobil/services/artisan_service.dart';
import 'package:art_eshop/mobil/services/notification_service.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/utilisateur_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    fetchNotification();
    fetchNombreArtisan();
    fetchNombreUtilisateur();
    super.initState();
  }

  NotificationService notificationService = NotificationService();
  List<NotificationClass> notifications = [];
  int nombreArtisan = 0;
  Commande commande = Commande();
  ArtisanProvider service = ArtisanProvider();
  UtilisateurService utilisateurService = UtilisateurService();
  ProduitProvider produitProvider = ProduitProvider();
  int nombreUser = 0;
  bool isPresent = false;

  Future<void> fetchNotification() async {
    await notificationService.listNotification().then((value) {
      print(value);
      setState(() {
        notifications = value;
      });
    }).catchError((err) {
      print(
          'Erreur lors de la récupération des notification : ${err.toString()}');
    });
  }

  Future<void> fetchNombreArtisan() async {
    await service.fetchArtisans().then((value) {
      print(value);
      setState(() {
        nombreArtisan = value;
      });
    }).catchError((err) {
      print(
          'Erreur lors de la récupération des nombre artisan : ${err.toString()}');
    });
  }

  Future<void> fetchNombreUtilisateur() async {
    await utilisateurService.fetchUtilisateur().then((value) {
      print(value);
      setState(() {
        nombreUser = value;
      });
    }).catchError((err) {
      print(
          'Erreur lors de la récupération des nombre user : ${err.toString()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        // width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      // height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                // height: 400,
                                // width: 150,
                                child: Column(children: [
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Couleurs.blanc,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Couleurs.gri,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 1)
                                          ],
                                          border: Border.all(
                                              width: 1, color: Couleurs.orange),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // height: 200,
                                      // width: 150,
                                      child: Column(
                                        children: [
                                          Container(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/art.svg'),
                                                  const Text(
                                                    "Artisans",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Center(
                                                child: Text(
                                              " $nombreArtisan",
                                              style: const TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text("Nombre d'artisan",
                                              style: TextStyle(
                                                  color: Couleurs.orange))
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      // margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Couleurs.blanc,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 5,
                                                color: Couleurs.gri,
                                                offset: const Offset(0, 0),
                                                spreadRadius: 1)
                                          ],
                                          border: Border.all(
                                              width: 1, color: Couleurs.orange),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      // height: 200,
                                      // width: 150,
                                      child: Column(
                                        children: [
                                          Container(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/icons/art.svg'),
                                                  const Text(
                                                    "Utilisateurs",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              )),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            child: Center(
                                                child: Text(
                                              "$nombreUser",
                                              style: const TextStyle(
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text("Nombre d'utilsateur",
                                              style: TextStyle(
                                                  color: Couleurs.orange))
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              flex: 4,
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                // margin: const EdgeInsets.only(right: 30),
                                decoration: BoxDecoration(
                                    color: Couleurs.blanc,
                                    border: Border.all(
                                        width: 1, color: Couleurs.orange),
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: Couleurs.gri,
                                          offset: const Offset(0, 0),
                                          spreadRadius: 1)
                                    ],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset("images/statis.png"),
                              )),
                        ],
                      ),
                    ),
                  ),
                  // ::::::::::::::::::::::::::::::;dexieme volet
                  Expanded(
                    flex: 2,
                    child: Container(
                      // margin: EdgeInsets.only(left: 10),
                      width: MediaQuery.of(context).size.width,
                      // margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding:const EdgeInsets.all(8),
                              // margin: const EdgeInsets.only(left: 40),
                              // height: 200,
                              decoration: BoxDecoration(
                                  color: Couleurs.blanc,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: Couleurs.gri,
                                        offset: const Offset(0, 0),
                                        spreadRadius: 1)
                                  ],
                                  border: Border.all(
                                      width: 1, color: Couleurs.orange),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset("images/cate.png"),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              // margin: const EdgeInsets.only(right: 30),
                              // height: 200,
                              decoration: BoxDecoration(
                                  color: Couleurs.blanc,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5,
                                        color: Couleurs.gri,
                                        offset: const Offset(0, 0),
                                        spreadRadius: 1)
                                  ],
                                  border: Border.all(
                                      width: 1, color: Couleurs.orange),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Couleurs.orange),
                                              child: SvgPicture.asset(
                                                  'assets/icons/cult.svg')),
                                          const Text(
                                            "Cultures",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: const Center(
                                        child: Text(
                                      "10",
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text("Nombre de Cultures",
                                      style: TextStyle(color: Couleurs.orange))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            // ::::::::::::;contenaire pour notification
            Expanded(
                flex: 2,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  margin: const EdgeInsets.only(top: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Couleurs.blanc,
                      border: Border.all(width: 1, color: Couleurs.orange),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            color: Couleurs.gri,
                            offset: const Offset(0, 0),
                            spreadRadius: 1)
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    margin: const EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Couleurs.orange),
                        child: Center(
                            child: Text(
                          "Notifications",
                          style: TextStyle(
                              color: Couleurs.blanc,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      // isPresent == null
                      Expanded(
                          child: ListView.builder(
                        itemCount: notifications.length,
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (BuildContext context, index) {
                          final notification = notifications[index];

                          return InkWell(
                              highlightColor: Couleurs.orange.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                              child: Column(
                                children: [
                                  Center(
                                      child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Text(
                                      "${notification.date}",
                                    ),
                                  )),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(5),
                                    // height: 20,
                                    // width: 100,
                                    decoration: BoxDecoration(
                                      color: Couleurs.blanc,
                                      border: Border.all(
                                          width: 1, color: Couleurs.gri),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${notification.description}",
                                        ),
                                        // Row(
                                        //   mainAxisAlignment:
                                        //       MainAxisAlignment.end,
                                        //   children: [
                                        //     Container(
                                        //       padding:
                                        //           EdgeInsets.only(right: 10),
                                        //       // child: Text(
                                        //       //   "11h:20",
                                        //       //   style: TextStyle(
                                        //       //       color: Couleurs.orange),
                                        //       // ),
                                        //     ),
                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  )
                                ],
                              ));
                        },
                      ))
                      // : Container(
                      //     height: 500,
                      //     child: const Center(
                      //         child: Text("Auccune Notification")),
                      //   )
                    ]),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
