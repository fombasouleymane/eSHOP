import 'dart:io';

import 'package:art_eshop/desktop/controller/global_key_controller.dart';
import 'package:art_eshop/desktop/model/culture_Entity.dart';
import 'package:art_eshop/desktop/pages/culture.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AjoutCulture extends StatefulWidget {
  const AjoutCulture({super.key});

  @override
  State<AjoutCulture> createState() => _AjoutCultureState();
}

class _AjoutCultureState extends State<AjoutCulture> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _ethnieController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  
 String imageFileName = "";
  String nimeType = "";
  
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


  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Couleurs.blanc),
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.all(10),
        // height: 600,
        width: 500,
        child: Column(children: [
          Expanded(
            flex: 2,
            child: InkWell(
               onTap: () async {
                      await _pickImage();
                      // selectedImage = await ImageCapture.pickImage();

                      setState(
                          () {}); // Pour reconstruire le widget avec la nouvelle image
                    },
              child: Container(
                // height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: Couleurs.gri)),
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
                                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Form(
                key: globalkeyController.formKeyCulture,
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: TextFormField(
                          controller: _nomController,
                          decoration: const InputDecoration(
                            labelText: "Nom *",
                            hintText: "Entree le Nom de la culture",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: TextFormField(
                          controller: _regionController,
                          decoration: const InputDecoration(
                            labelText: "Region *",
                            hintText: "Entree la region Culturelle",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: TextFormField(
                          controller: _ethnieController,
                          decoration: const InputDecoration(
                            labelText: "Ethnie *",
                            hintText: "Entree l'ethnie",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.only(
                          top: 15,
                        ),
                        child: TextFormField(
                          controller: _descriptionController,
                          decoration: const InputDecoration(
                            labelText: "Ethnie *",
                            hintText: "Entree l'ethnie",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9.0))),
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      // onTap: ()  {
                        onTap: () async {


                      if (globalkeyController.formKeyCulture.currentState!.validate()) {
                        CultureEntity culture = CultureEntity(
                          nom: _nomController.text,
                          regionCulturel: _regionController.text,
                          ethnie: _ethnieController.text,
                          description: _descriptionController.text
                          // admin: 
                          );
                      //   if (kIsWeb ){
                      //     try {
                          
                      //     // Appel de la méthode saveUser et attendre la réponse
                      //     final response = await service.ajouterAdmin(
                      //         admin, webImage, imageFileName, nimeType);

                      //     // Vérification du code de statut HTTP de la réponse
                      //     if (response.statusCode == 200) {
                      //       debugPrint(response.body);
                      //       // ignore: use_build_context_synchronously
                      //       Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //           builder: (context) => const Connexion(),
                      //         ),
                      //       );

                      //       // ignore: use_build_context_synchronously
                      //       FocusScope.of(context).requestFocus(FocusNode());
                      //     } else {
                      //       // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                      //     }
                      //   } catch (error) {
                      //     // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                      //   }
                      //     }else{
                            
                      //     }

                        
                       }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Couleurs.orange),
                        child: Center(
                          child: Text(
                            "Enregistrer",
                            style: TextStyle(
                                color: Couleurs.blanc,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
