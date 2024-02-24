import 'dart:io';

import 'package:art_eshop/desktop/controller/global_key_controller.dart';
import 'package:art_eshop/key.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/regions.dart';
import 'package:art_eshop/mobil/pages/login.dart';
import 'package:art_eshop/mobil/services/artisan_service.dart';
import 'package:art_eshop/mobil/services/image_picture.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ArtisanInscription extends StatefulWidget {
  const ArtisanInscription({super.key});

  @override
  State<ArtisanInscription> createState() => _ArtisanInscriptionState();
}

class _ArtisanInscriptionState extends State<ArtisanInscription> {
  // final _formkeyArtisan = GlobalKey<FormState>();
  // final formkey = GlobalKeyManager.formkeyArtisan;

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _entrepriseController = TextEditingController();
  final TextEditingController _sexeController = TextEditingController();
  final TextEditingController _teleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();

  ArtisantService service = ArtisantService();
  String sexe = "Homme";
  Region regionMali = Region();
  String selectedRegion = "Bamako";

  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        // title: const Text("Search"),
      ),
      body: Container(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 190,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Couleurs.orange,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(70))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: () async {
                      selectedImage = await ImageCapture.pickImage();
                      setState(
                          () {}); // Pour reconstruire le widget avec la nouvelle image
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                        backgroundColor: Couleurs.blanc,
                        backgroundImage: selectedImage != null
                            ? FileImage(selectedImage!)
                            : null,
                        child: selectedImage == null
                            ? Text(
                                "PHOTO",
                                style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.bold,
                                  color: Couleurs.gri,
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // :::::::::::::::::formulaire::::::

          Expanded(
              child: SingleChildScrollView(
            child: Form(
              key: globalkeyController.formkeyArtisan,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    // :::::::::::::::input nom
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _nomController,
                        decoration: const InputDecoration(
                          labelText: "Nom *",
                          hintText: "Nom artisan",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    // ::::::::::::::::::input prenom
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _prenomController,
                        decoration: const InputDecoration(
                          labelText: "Prenom *",
                          hintText: "Prenom artisan",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    // ::::::::::::::::::::::input email
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: "Email *",
                          hintText: "Entree adresse mail artisan",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    // ::::::::::::::::::::input mot de pass
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          labelText: "Mot de passe *",
                          hintText: "Entree mot de passe",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    // :::::::::::::::::::::;input region
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              height: 40,
                              width: 170,
                              // margin: const EdgeInsets.all(10.0),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  focusColor: Couleurs.orange,
                                  borderRadius: BorderRadius.circular(5),
                                  value:
                                      selectedRegion, // Utilisez une variable pour stocker la région sélectionnée
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRegion =
                                          value!; // Mettez à jour la région sélectionnée
                                    });
                                  },
                                  items: regionMali.regions.map((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              )),
                          Container(
                            height: 40,
                            width: 170,
                            // margin: const EdgeInsets.all(10.0),
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                    // style: TextStyle(color: Couleurs.orange),
                                    focusColor: Couleurs.orange,
                                    borderRadius: BorderRadius.circular(5),
                                    value: sexe,
                                    onChanged: (value) {
                                      sexe = value!;
                                      setState(() {});
                                    },
                                    items: ['Homme', 'Femme']
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList())),
                          ),
                        ],
                      ),
                    ),
                    // ::::::::::::::::::::::::::input telephone
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _teleController,
                        decoration: const InputDecoration(
                          labelText: "Telephone *",
                          hintText: "Entree votre numero de telephone",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    // ::::::::::::::::::::;input telephone
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _entrepriseController,
                        decoration: const InputDecoration(
                          labelText: "Entreprise*",
                          hintText: "Entree le nom de l'entreprise",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    // ::::::::::::::::::::;Description
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _desController,
                        maxLines: 4,
                        maxLength: 100,
                        decoration: const InputDecoration(
                          labelText: "Description*",
                          hintText: "Description de votre Entreprise",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),

                    // :::::::::::::::submit:::::::::::::::
                    InkWell(
                      highlightColor: Couleurs.gri,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        if (globalkeyController.formkeyArtisan.currentState!
                            .validate()) {
                          Artisan artisan = Artisan(
                              nom: _nomController.text,
                              prenom: _prenomController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              region: selectedRegion,
                              telephone: _teleController.text,
                              entreprise: _entrepriseController.text,
                              sexe: sexe,
                              description: _desController.text);
                          try {
                            // Appel de la méthode saveUser et attendre la réponse
                            final response = await service.enregistrerArtisan(
                                artisan, selectedImage!);

                            // Vérification du code de statut HTTP de la réponse
                            if (response.statusCode == 200) {
                              debugPrint("response: ");
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const login(
                              //       artisantype: true,
                              //     ),
                              //   ),
                              // );

                              // ignore: use_build_context_synchronously
                              FocusScope.of(context).requestFocus(FocusNode());
                            } else {
                              // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                            }
                          } catch (error) {
                            // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                          }
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        margin: const EdgeInsets.all(10.0),
                        // margin:
                        //     const EdgeInsets.only(top: 15, left: 40, right: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Couleurs.orange,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "ENREGISTRER",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Couleurs.blanc),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
            ),
          ))
        ],
      )),
    );
  }
}
