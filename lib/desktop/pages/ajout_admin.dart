import 'dart:io';

import 'package:art_eshop/desktop/model/admin_Entity.dart';
import 'package:art_eshop/desktop/pages/admin_connexion.dart';
import 'package:art_eshop/desktop/service/admin_service.dart';
import 'package:art_eshop/key.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/desktop/pages/picker_image.dart';
import 'package:art_eshop/mobil/services/image_picture.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../controller/global_key_controller.dart';

class AjoutArtisan extends StatefulWidget {
  const AjoutArtisan({super.key});

  @override
  State<AjoutArtisan> createState() => _AjoutArtisanState();
}

class _AjoutArtisanState extends State<AjoutArtisan> {
  // final _formkey = GlobalKey<FormState>();
  // final formkey = GlobalKeyManager.formkeyAdmin;

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prenomController = TextEditingController();
  final TextEditingController _sexeController = TextEditingController();
  final TextEditingController _teleController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String imageFileName = "";
  String nimeType = "";
  String sexe = "Homme";

  AdminService service = AdminService();

  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  // XFile? _pickedImage;

  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
          webImage = Uint8List(8);
        });
      } else {
        print('No image has been picked');
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      nimeType = image!.mimeType!;
      if (image != null) {
        imageFileName = getImageFileName(image);
        debugPrint("je suis image file $imageFileName");
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('No image has been picked');
      }
    } else {
      print('Something went wrong');
    }
  }

  String getImageFileName(XFile image) {
    List<String> pathParts = image.path.split('/');
    debugPrint("jes uuuuu ${image.path}");
    return pathParts.last;
  }

  // File? _pickedImage;
  // Uint8List webImage = Uint8List(8);
  // File? selectedImage;
  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();
    return Scaffold(
        body: Center(
      child: Container(
        width: 502,
        height: 550,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Couleurs.gri,
                offset: const Offset(0, 0),
                spreadRadius: 1)
          ],
          border: Border.all(width: 1, color: Couleurs.gri),
          borderRadius: BorderRadius.circular(20),
          color: Couleurs.blanc,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Couleurs.gri),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),

                // color: Couleurs.blanc,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                      child: InkWell(
                    onTap: () async {
                      await _pickImage();
                      // selectedImage = await ImageCapture.pickImage();

                      setState(
                          () {}); // Pour reconstruire le widget avec la nouvelle image
                    },
                    child: Container(
                        // decoration: BoxDecoration(
                        //   border: Border.all(width: 1, color: Couleurs.gri),
                        //   borderRadius: const BorderRadius.only(
                        //       topLeft: Radius.circular(10)),
                        // ),
                        width: 200,
                        height: 200,
                        child: _pickedImage == null
                            ? Center(
                                child: Text(
                                  "PHOTO",
                                  style: TextStyle(
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold,
                                    color: Couleurs.gri,
                                  ),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: kIsWeb
                                    ? Image.memory(webImage, fit: BoxFit.fill)
                                    : Image.file(_pickedImage!,
                                        fit: BoxFit.cover),
                              )),
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Ajouter un Admin",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/images/blanc.png"),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Couleurs.gri),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                // color: Couleurs.blanc,
              ),
              // ::::::::::::::::::::::::::formulaire

              child: Column(
                children: [
                  Form(
                    key: globalkeyController.formkeyAdmin,
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: _nomController,
                        decoration: const InputDecoration(
                          labelText: "Nom *",
                          hintText: "Entree votre Nom",
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
                  ),
                  // :::::::::::::::::::::::prenom
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _prenomController,
                      decoration: const InputDecoration(
                        labelText: "Prenom*",
                        hintText: "Entree votre prenom",
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
                  // ::::::::::::::::::::::email
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: "Email *",
                        hintText: "Entree votre adresse mail",
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
                  // :::::::::::::::::::::::::password::::::::::::::::::::::
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(
                        labelText: "Mot de passe *",
                        hintText: "Entree votre mot de passe",
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
                  // ::::::::::::::::::::telephone::::::::::::::::
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: _teleController,
                      decoration: const InputDecoration(
                        labelText: "Tel *",
                        hintText: "Entree votre numero",
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
                  // ::::::::::::::::::::sexe
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
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem(
                                value: value,
                                child: Text(value),
                              );
                            }).toList())),
                  ),
                  // :::::::::::::::::::::::::::::::;submit::::::::::::::;;;;;
                  InkWell(
                    highlightColor: Couleurs.gri,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      if (globalkeyController.formkeyAdmin.currentState!.validate()) {
                        Admin admin = Admin(
                            nom: _nomController.text,
                            prenom: _prenomController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            telephone: _teleController.text,
                            sexe: sexe);
                        if (kIsWeb ){
                          try {
                          
                          // Appel de la méthode saveUser et attendre la réponse
                          final response = await service.ajouterAdmin(
                              admin, webImage, imageFileName, nimeType);

                          // Vérification du code de statut HTTP de la réponse
                          if (response.statusCode == 200) {
                            debugPrint(response.body);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Connexion(),
                              ),
                            );

                            // ignore: use_build_context_synchronously
                            FocusScope.of(context).requestFocus(FocusNode());
                          } else {
                            // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                          }
                        } catch (error) {
                          // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                        }
                          }else{
                            
                          }

                        
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      margin:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Connexion()));
                            },
                            child: const Text("Connectez vous")),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
