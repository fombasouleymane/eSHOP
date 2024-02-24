import 'dart:io';

import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:art_eshop/mobil/services/image_picture.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtisanModifierProduit extends StatefulWidget {
  const ArtisanModifierProduit({super.key});

  @override
  State<ArtisanModifierProduit> createState() => _ArtisanModifierProduitState();
}

class _ArtisanModifierProduitState extends State<ArtisanModifierProduit> {
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;

  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      appBar: AppBar(
        backgroundColor: Couleurs.orange,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
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
          child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  selectedImage = await ImageCapture.pickImage();
                  setState(
                      () {}); // Pour reconstruire le widget avec la nouvelle image
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 40, right: 40),
                  width: MediaQuery.of(context).size.width,
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

              // ::::::input:::::::::::
              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Nom*",
                    hintText: "Entree le nom produit",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
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
              // ::::::::::::::input categories::::::::::::::

              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.check),
                    labelText: "Categorie*",
                    hintText: "Choisir une categorie",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
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
              // ::::::::::input:::::tail

              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.check),
                    labelText: "Taille *",
                    hintText: "Choisir la taille",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
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

              // :::::::input prix::::::::::::::::::
              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Prix *",
                    hintText: "Entree le prix",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
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

              // ::::::::::::::input quantiter:::::::::::::::::::::::::
              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Quantité*",
                    hintText: "Entree la quantite",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
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

              // ::::::::::description:::::::::::::::::
              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Description *",
                    hintText: "Entree une Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
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
              Container(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, bottom: 3),
                      child: const Text("Choisir une couleur"),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            choseCouleur();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 40, right: 10),
                            decoration: BoxDecoration(
                                color:
                                    isSelected ? Couleurs.blanc : pickerColor,
                                border:
                                    Border.all(width: 1, color: Couleurs.gri)),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            choseCouleur1();
                            debugPrint('je suis....$pickerColor1');
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color:
                                    isSelected1 ? Couleurs.blanc : pickerColor1,
                                border:
                                    Border.all(width: 1, color: Couleurs.gri)),
                            height: 30,
                            width: 30,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            choseCouleur2();
                          },
                          child: Container(
                            // margin:
                            //     const EdgeInsets.only(left: 40, right: 40),
                            decoration: BoxDecoration(
                                color:
                                    isSelected2 ? Couleurs.blanc : pickerColor2,
                                border:
                                    Border.all(width: 1, color: Couleurs.gri)),
                            height: 30,
                            width: 30,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              // :::::::::::;input culture::::::::::::::::

              Container(
                margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
                child: TextFormField(
                  // controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Culture *",
                    hintText: "Entree une culture",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9.0))),
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

              // :::::::::::::submit button:::::::::::::::
              InkWell(
                highlightColor: Couleurs.gri,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  margin: const EdgeInsets.only(top: 15, left: 40, right: 40),
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
      )),
    );
  }

  // :::::::::::::::::::::::
  Color pickerColor = const Color(0xffffffff);
  Color currentColor = const Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

// raise the [showDialog] widget
  void choseCouleur() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Couleur 1!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() => currentColor = pickerColor);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Color pickerColor1 = const Color(0xffffffff);
  Color currentColor1 = const Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor1(Color color1) {
    setState(() => pickerColor1 = color1);
  }

// raise the [showDialog] widget
  void choseCouleur1() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Couleur 2!'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor1,
                onColorChanged: changeColor1,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('OK'),
                onPressed: () {
                  setState(() => currentColor1 = pickerColor1);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Color pickerColor2 = const Color(0xffffffff);
  Color currentColor2 = const Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor2(Color color2) {
    setState(() => pickerColor2 = color2);
  }

// raise the [showDialog] widget
  void choseCouleur2() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(' Couleur 3'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: pickerColor2,
                onColorChanged: changeColor2,
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('Ok'),
                onPressed: () {
                  setState(() => currentColor2 = pickerColor2);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
