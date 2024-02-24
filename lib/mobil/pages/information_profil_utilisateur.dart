import 'package:art_eshop/key.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/page_bienvenue.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:art_eshop/mobil/pages/profil_utilisateur.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../desktop/controller/global_key_controller.dart';

class InformationProfilUtilisateur extends StatefulWidget {
  const InformationProfilUtilisateur({super.key});

  @override
  State<InformationProfilUtilisateur> createState() =>
      _InformationProfilUtilisateurState();
}

class _InformationProfilUtilisateurState
    extends State<InformationProfilUtilisateur> {
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();
  // final _formkeyInformationUser = GlobalKey<FormState>();
  // final formkey = GlobalKeyManager.formkeyInformationUser;
  Utilisateur utilisateur = Utilisateur();

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _paysController = TextEditingController();

  @override
  void initState() {
    super.initState();
    artisanSharedPreference.getUserFromSharedPreference().then((value) {
      if (value == utilisateur) {
        print("maudis utilisateur");
        utilisateur = value!;
        // } else {
        //   artisanSharedPreference
        //       .supprimerArtisanToSharedPreference()
        //       .then((value) {
        //     if (value == "Success") {}
        //   });
        //   print("object is not found");
      }
    }).catchError((onError) {
      print("maudis");
    });
  }

  bool isTextEditing = true;

  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(),

        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => const UtilisateurProfil()));
        //   },
        //   icon: FaIcon(
        //     FontAwesomeIcons.angleLeft,
        //     color: Couleurs.blanc,
        //     size: 30,
        //   ),
        // ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 20),
              color: Couleurs.orange,
              width: MediaQuery.of(context).size.width,
              height: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Couleurs.blanc),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/profil.png'),
                            fit: BoxFit.cover)),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isTextEditing = !isTextEditing;
                            });
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.penToSquare,
                            color: Couleurs.blanc,
                          )),
                      Container(
                        height: 40,
                        padding: const EdgeInsets.only(top: 10),
                        // decoration: BoxDecoration(

                        child: Text(
                          "Editer",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.blanc),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: context
                      .read<GlobalKeyController>()
                      .formkeyInformationUser,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Couleurs.gri))),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: _nomController,
                              readOnly: isTextEditing,
                              decoration: const InputDecoration(
                                hintText: "Ousmato",
                                border: InputBorder.none,
                              ),
                            )),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Couleurs.gri))),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: _prenomController,
                              readOnly: isTextEditing,
                              decoration: const InputDecoration(
                                hintText: "Toure",
                                border: InputBorder.none,
                              ),
                            )),
                        Container(
                            height: 50,
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1, color: Couleurs.gri))),
                            width: MediaQuery.of(context).size.width,
                            child: TextFormField(
                              controller: _paysController,
                              readOnly: isTextEditing,
                              decoration: const InputDecoration(
                                hintText: "Mali",
                                border: InputBorder.none,
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(width: 1, color: Couleurs.gri),
                            // top: BorderSide(
                            //   width: 1,
                            //   color: Couleurs.gri,
                            // )
                          )),
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                    FontAwesomeIcons.trashCan,
                                    color: Colors.red,
                                  )),
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                // width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  "Supprimer mon compte",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Couleurs.gri))),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: 3.1,
                                child: IconButton(
                                    onPressed: () {
                                      artisanSharedPreference
                                          .supprimerUserFromSharedPreferences()
                                          .then((value) {
                                        print(value);
                                        if (value == "succeeded") {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const PageBienvenue()),
                                              (route) => false);
                                        } else {
                                          return null;
                                        }
                                      });
                                    },
                                    icon: const FaIcon(
                                      FontAwesomeIcons.rightFromBracket,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    )),
                              ),
                              Container(
                                height: 40,
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                // width: MediaQuery.of(context).size.width,
                                child: const Text(
                                  "Deconnexion",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
