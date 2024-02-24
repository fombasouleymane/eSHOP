// ignore_for_file: use_build_context_synchronously

import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/desktop/pages/admin_connexion.dart';
import 'package:art_eshop/desktop/pages/admin_list_categorie.dart';
import 'package:art_eshop/key.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/controller_mobil/bottom_navigation_bar.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/accueil.dart';
import 'package:art_eshop/mobil/services/categorie_service.dart';
import 'package:art_eshop/mobil/services/notification_service.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/taille_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../desktop/controller/global_key_controller.dart';

class Popup {
  final TextEditingController _emailController2 = TextEditingController();
  final TextEditingController _emailController3 = TextEditingController();
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  // ServiceLoger service = ServiceLoger();

  // void dialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Container(
  //             child: AlertDialog(
  //           title: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Container(
  //                 height: 1,
  //                 width: 40,
  //                 decoration: const BoxDecoration(
  //                     color: Color.fromARGB(255, 160, 159, 159)),
  //               ),
  //               const Text("  Forget Password  "),
  //               Container(
  //                 height: 1,
  //                 width: 40,
  //                 decoration: const BoxDecoration(
  //                     color: Color.fromARGB(255, 160, 159, 159)),
  //               ),
  //             ],
  //           ),
  //           content: Container(
  //             height: 220,
  //             // width: 200,
  //             child: Form(
  //               key: _formkey,
  //               child: Column(
  //                 children: [
  //                   const Text(
  //                     "Entrez votre mail pour la  reuitialisation  de votre mot de passe",
  //                     textAlign: TextAlign.justify,
  //                   ),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   Container(
  //                     decoration: const BoxDecoration(
  //                         border: Border.symmetric(
  //                             horizontal:
  //                                 BorderSide(width: 0.5, color: Colors.grey))),
  //                   ),
  //                   const SizedBox(
  //                     height: 20,
  //                   ),
  //                   Container(
  //                     margin: const EdgeInsets.only(bottom: 10),
  //                     child: TextFormField(
  //                       controller: _emailController2,
  //                       decoration: const InputDecoration(
  //                         labelText: "Email *",
  //                         hintText: "Entree votre adresse mail",
  //                         border: OutlineInputBorder(
  //                             borderRadius:
  //                                 BorderRadius.all(Radius.circular(9.0))),
  //                         contentPadding: EdgeInsets.all(8.0),
  //                       ),
  //                       validator: (value) {
  //                         if (value == null || value.isEmpty) {
  //                           return "Ce champs est Obligatoir";
  //                         }
  //                         return null;
  //                       },
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     width: double.infinity,
  //                     child: ElevatedButton(
  //                         onPressed: () async {
  //                           if (_formkey.currentState!.validate()) {
  //                             await service
  //                                 .verifyUserEmail(_emailController2.text)
  //                                 .then((value) {
  //                               dialogConfirmCode(context, value);
  //                             }).catchError((onError) {
  //                               // ignore: prefer_interpolation_to_compose_strings
  //                               throw ("erreur : " + onError);
  //                             });
  //                           }
  //                         },
  //                         child: const Text("Envoyer")),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           // actions: [],
  //         ));
  //       });
  // }

  // final formkeyconfirm = GlobalKeyManager.formkeyConfirmeCodeAdmin;
  void dialogConfirmCode(BuildContext context, String code) {
    final globalkeyController = context.read<GlobalKeyController>();
    showDialog(
        context: context,
        builder: (context) {
          return Container(
              child: AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 160, 159, 159)),
                ),
                const Text("  CONFIRMER CODE  "),
                Container(
                  height: 1,
                  width: 30,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 160, 159, 159)),
                ),
              ],
            ),
            content: SizedBox(
              height: 220,
              width: 200,
              child: Form(
                key: globalkeyController.formkeyConfirmeCodeAdmin,
                child: Column(
                  children: [
                    const Text(
                      "Entrez votre code de confirmation",
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(width: 0.5, color: Colors.grey))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: TextFormField(
                        controller: _emailController3,
                        decoration: const InputDecoration(
                          // labelText: "",
                          hintText: "Entree votre code",
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {
                            if (globalkeyController
                                .formkeyConfirmeCodeAdmin.currentState!
                                .validate()) {
                              if (_emailController3.text == code) {
                                // ::::doit ce rediriger vers la page de modification de password
                              }
                            }
                          },
                          child: const Text("Envoyer")),
                    )
                  ],
                ),
              ),
            ),
            // actions: [],
          ));
        });
  }

  void profilAdministrateur(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Align(
            alignment: Alignment.centerRight,
            child: Dialog(
              elevation: 0,
              alignment: Alignment.bottomRight,
              child: Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Couleurs.blanc,
                ),
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                        height: 100,
                        color: Couleurs.orange,
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  color: Couleurs.blanc,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage(
                                "assets/images/profil.png",
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40, right: 20),
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [SvgPicture.asset('assets/icons/edit.svg')],
                        ),
                      )
                    ]),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 20,
                      child: const Center(child: Text("Ousmato Toure")),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 20,
                      child:
                          const Center(child: Text("ousmatotoure98@gmail.com")),
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    Container(
                      height: 1,
                      color: Couleurs.gri,
                    ),
                    Container(
                      child: Row(
                        children: [
                          // SvgPicture.asset('assets/icons/deconnexion.svg'),
                          TextButton(
                              onPressed: (() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Connexion()));
                              }),
                              child: const Text("Deconnexion"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  // :::::::::::::::::::::::::::::::::::;ajouter cultur
  void adminAjouteCulture(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Align(
            child: Dialog(
              child: Container(
                decoration: BoxDecoration(
                    color: Couleurs.blanc,
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(10),
                width: 400,
                height: 600,
                child: Form(
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border:
                                  Border.all(width: 1, color: Couleurs.gri)),
                          // child: Image.network("src"),
                        ),
                      ),
                      // Container(child: Container())
                      Container(
                        // height: 300,
                        child: Column(
                          children: [
                            Container(
                              // height: 30,
                              margin: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: _nomController,
                                decoration: const InputDecoration(
                                  labelText: "Date *",
                                  hintText: "Entree la date",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0))),
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
                          ],
                        ),
                      ),
                      Container(
                        // height: 30,
                        margin: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _regionController,
                          decoration: const InputDecoration(
                            labelText: "Region *",
                            hintText: "Entree la region",
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
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _dateController,
                          decoration: const InputDecoration(
                            labelText: "Nom *",
                            hintText: "Entree  Nom de la culture",
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Couleurs.orange,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            "Enregistrer",
                            style: TextStyle(color: Couleurs.blanc),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  // :::::::::::::::::::::::::::::::::::deconnection
  void deconnexion(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            decoration: BoxDecoration(
                color: Couleurs.blanc, borderRadius: BorderRadius.circular(4)),
            height: 190,
            width: 250,
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: Couleurs.orange,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(4),
                        topLeft: Radius.circular(4))),
                height: 50,
                child: Center(
                    child: Text(
                  "Deconnexion",
                  style: TextStyle(
                      color: Couleurs.blanc,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                    "Voulez vous vraiment vous déconnecter de cette Application"),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Couleurs.orange,
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                              child: Text(
                            "Oui",
                            style: TextStyle(color: Couleurs.blanc),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 100,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Couleurs.orange,
                              ),
                              borderRadius: BorderRadius.circular(4)),
                          child: Center(
                              child: Text(
                            "Non",
                            style: TextStyle(color: Couleurs.orange),
                          )),
                        ),
                      )
                    ]),
              )
            ]),
          ),
        );
      },
    );
  }

  // :::::::::::::::::::::;success
  void success(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return Dialog(
            insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                padding: const EdgeInsets.only(top: 20),
                height: 190,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Activer avec Success",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      "icons/succes.svg",
                      height: 100,
                    ),
                  ],
                )),
          );
        });
  }

// :::::::::::::::::;supprimer un produit
  Produit produit = Produit();
  ProduitProvider produitProvider = ProduitProvider();
  void supprimerMobile(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(const Duration(seconds: 1), () {
          //   Navigator.of(context).pop(true);
          // });
          return Dialog(
            insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                // padding: const EdgeInsets.only(top: 20),
                height: 190,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Center(
                        child: Text(
                          "Avertissement",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.blanc),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Center(
                        child: Text(
                          "Voulez-vous vraiment supprimer ce produit de votre catalogue",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              produit = Provider.of<ProduitController>(context,
                                      listen: false)
                                  .produitAsupprimmer;
                              produitProvider.supprrimer(produit.idProduit!);
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 35,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  "Supprimer",
                                  style: TextStyle(
                                    color: Couleurs.blanc,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                "Annuler",
                                style: TextStyle(color: Couleurs.blanc),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }

// :::::::::::::::::;;poppup de succes mobil
  void successMobil(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                padding: const EdgeInsets.only(top: 20),
                height: 200,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Acheter avec Succés",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      "assets/icons/succes.svg",
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(false);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const BottomNavigationExample()),
                                (route) => false);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 50,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Couleurs.orange,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    color: Couleurs.blanc,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          );
        });
  }

  final TextEditingController _categorieController = TextEditingController();

  CategorieService serviceCategorie = CategorieService();
  // final formkey = GlobalKeyManager.formkeyCategory;

  void ajouterCategories(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Form(
              key: context.read<GlobalKeyController>().formkeyCategory,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Couleurs.blanc),
                height: 200,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: _categorieController,
                        decoration: InputDecoration(
                          focusColor: Couleurs.orange,
                          labelText: "Categorie *",
                          hintText: "Entree le nom d'une Categorie",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: const EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (context
                            .read<GlobalKeyController>()
                            .formkeyCategory
                            .currentState!
                            .validate()) {
                          Categories categories = Categories(
                            nom: _categorieController.text,
                          );
                          try {
                            // Appel de la méthode saveUser et attendre la réponse
                            final response =
                                await serviceCategorie.add(categories);

                            // Vérification du code de statut HTTP de la réponse
                            if (response.statusCode == 200) {
                              debugPrint("response: ");
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListCategories(),
                                ),
                              );

                              FocusScope.of(context).requestFocus(FocusNode());
                              context
                                  .read<GlobalKeyController>()
                                  .formkeyCategory
                                  .currentState
                                  ?.reset();
                            } else {
                              // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                            }
                          } catch (error) {
                            // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                          }
                        }
                        // popup.ajouterCategories(context);
                      },
                      child: Container(
                          width: 300,
                          height: 30,
                          margin: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Couleurs.orange,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            "Engregistrer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Couleurs.blanc),
                          ))),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }

  //
  void modifierProduit(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Form(
              // key: context.read<GlobalKeyController>().formkeyCategory,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Couleurs.blanc),
                height: 200,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: _categorieController,
                        decoration: InputDecoration(
                          focusColor: Couleurs.orange,
                          labelText: "Categorie *",
                          hintText: "Entree le nom d'une Categorie",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: const EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (context
                            .read<GlobalKeyController>()
                            .formkeyCategory
                            .currentState!
                            .validate()) {
                          Categories categories = Categories(
                            nom: _categorieController.text,
                          );
                          try {
                            // Appel de la méthode saveUser et attendre la réponse
                            final response =
                                await serviceCategorie.add(categories);

                            // Vérification du code de statut HTTP de la réponse
                            if (response.statusCode == 200) {
                              debugPrint("response: ");
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListCategories(),
                                ),
                              );

                              FocusScope.of(context).requestFocus(FocusNode());
                              context
                                  .read<GlobalKeyController>()
                                  .formkeyCategory
                                  .currentState
                                  ?.reset();
                            } else {
                              // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                            }
                          } catch (error) {
                            // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                          }
                        }
                        // popup.ajouterCategories(context);
                      },
                      child: Container(
                          width: 300,
                          height: 30,
                          margin: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Couleurs.orange,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            "Engregistrer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Couleurs.blanc),
                          ))),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }

  // :::::::::::::::::::::;ajouter taille
  final TextEditingController _tailleController = TextEditingController();

  TailleService serviceTaille = TailleService();
  // final formkeyTaille = GlobalKeyManager.formkeyTaille;

  void ajouterTaille(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Form(
              key: context.read<GlobalKeyController>().formkeyTaille,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Couleurs.blanc),
                height: 200,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          const EdgeInsets.only(top: 15, left: 10, right: 10),
                      child: TextFormField(
                        controller: _tailleController,
                        decoration: InputDecoration(
                          focusColor: Couleurs.orange,
                          labelText: "Taille *",
                          hintText: "Choisir une taille",
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(9.0))),
                          contentPadding: const EdgeInsets.all(8.0),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champs est Obligatoir";
                          }
                          return null;
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        if (context
                            .read<GlobalKeyController>()
                            .formkeyTaille
                            .currentState!
                            .validate()) {
                          TailleProduit taille = TailleProduit(
                            libelle: _tailleController.text,
                          );
                          try {
                            // Appel de la méthode saveUser et attendre la réponse
                            final response = await serviceTaille.add(taille);

                            // Vérification du code de statut HTTP de la réponse
                            // ignore: duplicate_ignore
                            if (response.statusCode == 200) {
                              debugPrint("response: ");
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ListTile(),
                                ),
                              );

                              FocusScope.of(context).requestFocus(FocusNode());
                              context
                                  .read<GlobalKeyController>()
                                  .formkeyTaille
                                  .currentState
                                  ?.reset();
                            } else {
                              // Échec : Gérer l'erreur ici, par exemple afficher un toast/modal d'erreur
                            }
                          } catch (error) {
                            // Gérer les erreurs générales ici, par exemple afficher un toast/modal d'erreur
                          }
                        }
                        // popup.ajouterCategories(context);
                      },
                      child: Container(
                          width: 300,
                          height: 30,
                          margin: const EdgeInsets.only(
                              top: 15, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: Couleurs.orange,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                              child: Text(
                            "Engregistrer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Couleurs.blanc),
                          ))),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // )
                  ],
                ),
              ),
            ),
          );
        });
  }

  // ::::::::::::::::::::::::::::::::::::::::::::;
}

// :::::::::::::::::::::::::::::ajouter cultures:::::::::::::::::::::;
