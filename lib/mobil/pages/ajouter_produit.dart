// ignore_for_file: sdk_version_since

import 'dart:io';

import 'package:art_eshop/key.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/controller_mobil/drapdawn_categorie_selection.dart';
import 'package:art_eshop/mobil/models/controller_mobil/drapdawn_taille_selection.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/couleur_Entity.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:art_eshop/mobil/services/artisan_service.dart';
import 'package:art_eshop/mobil/services/categorie_service.dart';
import 'package:art_eshop/mobil/services/image_picture.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:art_eshop/mobil/services/taille_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

import '../../desktop/controller/global_key_controller.dart';

class AjouterProduit extends StatefulWidget {
  const AjouterProduit({super.key});

  @override
  State<AjouterProduit> createState() => _AjouterProduitState();
}

class _AjouterProduitState extends State<AjouterProduit> {
  // final _formkeyProduit = GlobalKey<FormState>();
  // final formkey = GlobalKeyManager.formkeyProduit;

  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();
  final TextEditingController _quantiteController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  final TextEditingController _cultureController = TextEditingController();
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;

  late Future<List<Categories>> _categories;
  Categories? _selectedCategory;
  late Future<List<TailleProduit>> _tailleProduit;
  List<TailleProduit> tailleProduits = [];
  List<TailleProduit> initialTailleProduits = [];
  List<ValueItem>? selectedTailles = [];
  late Artisan artisan;
  ArtisantService artisantService = ArtisantService();
  ProduitService produitService = ProduitService();
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();
  // CouleursProduit couleurpro = CouleursProduit(valeur: '');

  @override
  void initState() {
    super.initState();
    _categories = CategorieService().getAllCategories();
    print('----isarc------${_categories}');
    _tailleProduit = TailleService().getAllTailleProduit();
    artisanSharedPreference.getArtisanFromSharedPreference().then((value) {
      if (value != null) {
        artisan = value;
      }
    });
  }

  updateListTaille(List<ValueItem> listItem) {
    tailleProduits.clear();
    for (var element in listItem) {
      TailleProduit? taille = initialTailleProduits
          .where((ele) => ele.idTaille == int.parse(element.value!))
          .firstOrNull;
      tailleProduits.add(taille!);
    }
    print(tailleProduits.toString());
  }

  Popup popup = Popup();
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Couleurs.orange,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(70))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Ajouter Votre Produit",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Couleurs.blanc),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Form(
                key: globalkeyController.formkeyProduit,
                child: Column(
                  children: [
                    InkWell(
                        onTap: () async {
                          selectedImage = await ImageCapture.pickImage();
                          setState(
                              () {}); // Pour reconstruire le widget avec la nouvelle image
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 40, right: 40),
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Couleurs.gri),
                              borderRadius: BorderRadius.circular(5)
                              // Ajoutez ici vos décorations pour le conteneur
                              ),
                          child: selectedImage != null
                              ? Image.file(
                                  selectedImage!,
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Text(
                                    "PHOTO",
                                    style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold,
                                      color: Couleurs.gri,
                                    ),
                                  ),
                                ),
                        )),

                    // ::::::input:::::::::::
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: TextFormField(
                        controller: _nomController,
                        maxLength: 16,
                        decoration: const InputDecoration(
                          labelText: "Nom*",
                          hintText: "Entree le nom produit",
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
                    // ::::::::::::::input categories::::::::::::::

                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: FutureBuilder<List<Categories>>(
                        future: _categories,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Erreur : ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text('Aucune catégorie trouvée');
                          } else {
                            List<Categories> categories = snapshot.data!;
                            return CategoryDropdown(
                              categories: categories,
                              selectedCategory: _selectedCategory,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedCategory = newValue;
                                });
                                print(
                                    '------------------cat----${_selectedCategory}');
                              },
                            );
                          }
                        },
                      ),
                    ),
                    // ::::::::::input:::::tail

                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: Wrap(
                        children: [
                          MultiSelectDropDown.network(
                            dropdownHeight: 200,
                            onOptionSelected: (selectedOptions) {
                              updateListTaille(selectedOptions);
                              // debugPrint(selectedOptions.toString());
                            },
                            searchEnabled: true,
                            networkConfig: NetworkConfig(
                              url: 'http://10.0.2.2:8080/taille/list',
                              method: RequestMethod.get,
                              headers: {
                                'Content-Type': 'application/json',
                              },
                            ),
                            chipConfig:
                                const ChipConfig(wrapType: WrapType.wrap),
                            responseParser: (response) {
                              debugPrint('Response: $response');

                              final list = (response as List).map((e) {
                                final item = e as Map<String, dynamic>;
                                return ValueItem(
                                  label: item['libelle'],
                                  value: item['idTaille'].toString(),
                                );
                              }).toList();

                              final listInit = (response)
                                  .map((e) => TailleProduit.fromMap(e))
                                  .toList();
                              initialTailleProduits = listInit;

                              return Future.value(list);
                            },
                            responseErrorBuilder: ((context, body) {
                              return const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Text('Error fetching the data'),
                              );
                            }),
                          ),
                          const SizedBox(height: 50)
                        ],
                      ),
                    ),

                    // ::::::::::::::input quantiter:::::::::::::::::::::::::
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: TextFormField(
                        controller: _quantiteController,
                        decoration: const InputDecoration(
                          labelText: "Quantité*",
                          hintText: "Entree la quantite",
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
                    // ::::::::::::::::::::::::::input prix:::::::::::::::
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: TextFormField(
                        controller: _prixController,
                        decoration: const InputDecoration(
                          labelText: "Prix*",
                          hintText: "Entree le prix",
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

                    // ::::::::::description:::::::::::::::::
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: TextFormField(
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          labelText: "Description *",
                          hintText: "Entree une Description",
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

                    // ::::::::::::::::choix de couleur
                    Container(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(
                                top: 15, left: 40, bottom: 3),
                            child: const Text("Choisir une couleur"),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  choseCouleur();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 40, right: 10),
                                  decoration: BoxDecoration(
                                      color: isSelected
                                          ? Couleurs.blanc
                                          : pickerColor,
                                      border: Border.all(
                                          width: 1, color: Couleurs.gri)),
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  choseCouleur1();
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      color: isSelected1
                                          ? Couleurs.blanc
                                          : pickerColor1,
                                      border: Border.all(
                                          width: 1, color: Couleurs.gri)),
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
                                      color: isSelected2
                                          ? Couleurs.blanc
                                          : pickerColor2,
                                      border: Border.all(
                                          width: 1, color: Couleurs.gri)),
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
                      margin:
                          const EdgeInsets.only(top: 15, left: 40, right: 40),
                      child: TextFormField(
                        controller: _cultureController,
                        decoration: const InputDecoration(
                          labelText: "Culture *",
                          hintText: "Entree une culture",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return "Ce champs est Obligatoir";
                        //   }
                        //   return null;
                        // },
                      ),
                    ),

                    // :::::::::::::submit button:::::::::::::::
                    InkWell(
                      highlightColor: Couleurs.gri,
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                        if (globalkeyController.formkeyProduit.currentState!
                            .validate()) {
                          List<CouleursProduit> couleursSelectionnees =
                              couleurmain();
                          print(
                              '------------------------------${tailleProduits}');
                          Produit produit = Produit(
                              nom: _nomController.text,
                              //  idCategorie: _selectedCategory!.idCategorie!,
                              prix: double.parse(_prixController.text),
                              quantite: double.parse(_quantiteController.text),
                              description: _descriptionController.text,
                              culture: _cultureController.text);
                          try {
                            final response = await produitService.ajoutProduit(
                              produit,
                              selectedImage!,
                              tailleProduits,
                              couleursSelectionnees,
                              artisan,
                              _selectedCategory!,
                            );
                            if (response.statusCode == 200) {
                              debugPrint("response: ");
                              print(response.body);
                              // ignore: use_build_context_synchronously
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ArtisanProfil(),
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
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        margin:
                            const EdgeInsets.only(top: 15, left: 40, right: 40),
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
              // ::::::input ::::::::::::::::
            ),
          )
        ],
      ),
    );
  }

// :::::::::::::::::::::::::::::::::::::::::::

  List<Color> selectedColors = [
    const Color(0xffffffff),
    const Color(0xffffffff),
    const Color(0xffffffff)
  ];
// create some values
  Color pickerColor = const Color(0xffffffff);
  Color currentColor = const Color(0xff443a49);

// ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
    print(' pickerColor');
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
                  setState(() {
                    selectedColors[0] = pickerColor;
                    Navigator.of(context).pop();
                    debugPrint("selectedColors${selectedColors[0]}");
                  });
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
                  setState(() {
                    selectedColors[1] = pickerColor1;
                    Navigator.of(context).pop();
                    debugPrint("selectedColors1 ${selectedColors[1]}");
                  });
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
                  setState(() {
                    selectedColors[2] = pickerColor2;
                    Navigator.of(context).pop();
                    debugPrint("selectedColors2 ${selectedColors[2]}");
                  });
                },
              ),
            ],
          );
        });
  }
  // ::::::::::::::::;

  CouleursProduit convertirCouleurEnCouleurs(Color couleur, int? id) {
    String valeurCouleur = '#${couleur.value.toRadixString(16).substring(2)}';
    print(valeurCouleur);
    return CouleursProduit(idCouleur: id, libelle: valeurCouleur);
  }

  List<CouleursProduit> couleurmain() {
    List<int?> ids = [1, 2, 3];

    List<CouleursProduit> couleursConverties = [];

    for (int i = 0; i < selectedColors.length; i++) {
      couleursConverties
          .add(convertirCouleurEnCouleurs(selectedColors[i], ids[i]));
    }

    // Affichage des couleurs converties
    for (var couleur in couleursConverties) {
      print("Couleur - ID: ${couleur.idCouleur}, libelle: ${couleur.libelle}");
    }
    return couleursConverties;
  }
}
