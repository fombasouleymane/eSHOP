import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/services/categorie_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListTaille extends StatefulWidget {
  const ListTaille({super.key});

  @override
  State<ListTaille> createState() => _ListTailleState();
}

class _ListTailleState extends State<ListTaille> {
  CategorieService service = CategorieService();
  Popup popup = Popup();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          popup.ajouterTaille(context);
                        },
                        child: Container(
                            width: 125,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Couleurs.orange,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                              "Ajouter",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Couleurs.blanc),
                            ))),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(width: 1, color: Couleurs.gri)),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Num",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                        Container(
                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Nom",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                        Container(

                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Nombre de Produits",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                        Container(

                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Actions",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                      ]),
                ),
                // ::::::::::::::::contenu
                Expanded(
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (BuildContext context, index) {
                          return Container(
                            // padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        width: 1, color: Couleurs.gri)),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  // contenue:::::::::::::::::::;
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(3),
                                            child: const Column(
                                              children: [
                                                Text(
                                                  "1",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            // padding: const EdgeInsets.all(3),
                                            child: const Column(
                                          children: [
                                            Text(
                                              "Teinture",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        )),
                                        Container(
                                            // padding: const EdgeInsets.all(3),
                                            child: const Column(
                                          children: [
                                            Text(
                                              "45",
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        )),
                                        Container(
                                            // padding: const EdgeInsets.all(3),
                                            child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  //   Navigator.push(
                                                  //       context,
                                                  //       MaterialPageRoute(
                                                  //           builder: (context) =>
                                                  //               const ArtisanModifierProduit()));
                                                },
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.penToSquare,
                                                  color: Colors.black,
                                                )),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.trashCan,
                                                  color: Colors.red,
                                                )),
                                          ],
                                        )),
                                      ]),
                                  // ::
                                ],
                              ),
                            ),
                          );
                        })),
              ],
            ),
          )),
    );
  }
}
