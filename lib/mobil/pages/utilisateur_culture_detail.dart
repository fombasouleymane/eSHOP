import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/utilisateur_culture.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UtilisateurCultureDetail extends StatefulWidget {
  const UtilisateurCultureDetail({super.key});

  @override
  State<UtilisateurCultureDetail> createState() =>
      _UtilisateurCultureDetailState();
}

class _UtilisateurCultureDetailState extends State<UtilisateurCultureDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
                context,
                MaterialPageRoute(
                    builder: (context) => const UtilisateurCulture()));
          },
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            color: Couleurs.blanc,
            size: 30,
          ),
        ),
        title: Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            Container(
              child: Text(
                "Culture Dogon",
                style: TextStyle(
                    color: Couleurs.blanc,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          ),
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 400,
              mainAxisSpacing: 20,
            ),
            shrinkWrap: true,
            itemCount: 7,
            itemBuilder: (BuildContext context, index) {
              return Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    color: Couleurs.blanc,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Couleurs.gri,
                          offset: const Offset(0, 0),
                          spreadRadius: 1)
                    ],
                    border: Border.all(width: 1, color: Couleurs.orange)),
                child: Column(children: [
                  Expanded(
                      child: Container(
                    child: const Text(
                      "Danse de Kora",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  )),
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: Colors.amber,
                      margin: const EdgeInsets.all(10),
                      child: Image.asset('assets/images/plover.png'),
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            border: Border(
                                top:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        child: const Text(
                            "Très codifiées, messi Très codifiées, messi les danses dogons expriment la formation du monde l'organisation du systeme solaire"),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                top:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 30,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                            margin:
                                                const EdgeInsets.only(top: 15),
                                            child: Icon(
                                              FontAwesomeIcons.thumbsUp,
                                              color: Couleurs.gri,
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 0,
                                          child: Text(
                                            "23",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Text("j'aime"),
                                ],
                              ),
                              Icon(
                                FontAwesomeIcons.download,
                                color: Couleurs.gri,
                              ),
                            ]),
                      ))
                ]),
              );
            },
          ))
        ]),
      ),
    );
  }
}
