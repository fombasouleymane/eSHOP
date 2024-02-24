import 'package:art_eshop/key.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/page_bienvenue.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../desktop/controller/global_key_controller.dart';

class InformationProfilArtisan extends StatefulWidget {
  const InformationProfilArtisan({super.key});

  @override
  State<InformationProfilArtisan> createState() =>
      _InformationProfilArtisanState();
}

class _InformationProfilArtisanState extends State<InformationProfilArtisan> {
  // final _formkey = GlobalKey<FormState>();
  // final formkey = GlobalKeyManager.keyProfilArtisan;

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _entrepriseController = TextEditingController();
  final TextEditingController _sexeController = TextEditingController();
  final TextEditingController _teleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  String sexe = "Homme";

  bool isTextEditing = true;
  bool isShow = false;
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();
  late Artisan artisan = Artisan();

  @override
  void initState() {
    super.initState();
    artisanSharedPreference.getArtisanFromSharedPreference().then((value) {
      if (value == artisan) {
        print("maudis artisan");
        artisan = value!;
      } else {
        artisanSharedPreference
            .supprimerArtisanToSharedPreference()
            .then((value) {
          if (value == "Success") {}
        });
        print("object is not found");
      }
    }).catchError((onError) {
      print("maudis");
    });
  }

  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
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
                            isShow = true;
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
                  key: context.read<GlobalKeyController>().keyProfilArtisan,
                  child: Column(children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: artisan.nom,
                          // controller: _nomController,
                          readOnly: isTextEditing,
                          decoration: const InputDecoration(
                            // hintText: "Ousmato",
                            border: InputBorder.none,
                          ),
                        )),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: artisan.prenom,
                          // controller: _prenomController,
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
                                bottom:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: artisan.telephone,
                          // controller: _teleController,
                          readOnly: isTextEditing,
                          decoration: const InputDecoration(
                            hintText: "73898877",
                            border: InputBorder.none,
                          ),
                        )),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Couleurs.gri))),
                      width: MediaQuery.of(context).size.width,
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                              value: sexe,
                              onChanged: (value) {
                                sexe = value!;
                                setState(() {});
                              },
                              items: [
                                'Homme',
                                'Femme'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList())),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          // initialValue: artisan.entreprise,
                          controller: _entrepriseController,
                          readOnly: isTextEditing,
                          decoration: InputDecoration(
                            hintText: "${artisan.entreprise}",
                            border: InputBorder.none,
                          ),
                        )),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: artisan.region,
                          // controller: _regionController,
                          readOnly: isTextEditing,
                          decoration: const InputDecoration(
                            hintText: "Bamako",
                            border: InputBorder.none,
                          ),
                        )),
                    Container(
                        // height: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Couleurs.gri))),
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          initialValue: artisan.description,
                          // controller: _desController,
                          maxLines: 5,
                          readOnly: isTextEditing,
                          decoration: const InputDecoration(
                            hintText:
                                "ArtEshop une Entreprise qui evolue dans le dommaine de la digitalisation",
                            border: InputBorder.none,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Couleurs.gri))),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                // appeler le poppup de supression
                              },
                              icon: const FaIcon(
                                FontAwesomeIcons.trashCan,
                                color: Colors.red,
                              )),
                          Container(
                            height: 40,
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            // width: MediaQuery.of(context).size.width,
                            child: const Text(
                              "Supprimer mon compte",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
                              bottom:
                                  BorderSide(width: 1, color: Couleurs.gri))),
                      child: Row(
                        children: [
                          Transform.rotate(
                            angle: 3.1,
                            child: IconButton(
                                onPressed: () {
                                  // appeler poppup de deconnection
                                  artisanSharedPreference
                                      .supprimerArtisanToSharedPreference()
                                      .then((value) {
                                    print(value);
                                    if (value == "Success") {
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
                            padding: const EdgeInsets.only(left: 10, top: 10),
                            // width: MediaQuery.of(context).size.width,
                            child: const Text(
                              "Deconnexion",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
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
      floatingActionButton: Visibility(
        visible: isShow = !isShow,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 125,
            decoration: BoxDecoration(
                color: Couleurs.orange,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: Text(
                "Modifier",
                style: TextStyle(color: Couleurs.blanc, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
