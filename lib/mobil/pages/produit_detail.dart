import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/commande_Entity.dart';
import 'package:art_eshop/mobil/models/controller_mobil/popup_succes/comande_reuissis.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/couleur_Entity.dart';
import 'package:art_eshop/mobil/pages/listProduit.dart';
import 'package:art_eshop/mobil/pages/utilisateur_mode_paiement.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProduitDetail extends StatefulWidget {
  const ProduitDetail({super.key});

  @override
  State<ProduitDetail> createState() => _ProduitDetailState();
}

class _ProduitDetailState extends State<ProduitDetail> {
  Produit produit = Produit();
  List<CouleursProduit> couleursProduit = [];
  List<TailleProduit> tailleProduit = [];
  Commande commande = Commande();
  // bool isShow = false;
  double quantityChoisie = 1;
  int checkBoxColor = 1;
  int shapeSelectedTaille = 1;
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();
  ProduitProvider produitProvider = ProduitProvider();

  bool isSelected1 = false; // Variable pour suivre l'état de la sélection
  bool isSelected2 = false; // Variable pour suivre l'état de la sélection
  bool isSelected3 = false; // Variable pour suivre l'état de la sélection

  void toggleSelection1() {
    setState(() {
      isSelected1 = !isSelected1; // Inversion de l'état de la sélection
    });
  }

  void toggleSelection2(int index) {
    setState(() {
      shapeSelectedTaille = index;
      // isSelected2 = !isSelected2; // Inversion de l'état de la sélection
    });
  }

  void toggleSelection3() {
    setState(() {
      isSelected3 = !isSelected3; // Inversion de l'état de la sélection
    });
  }

  bool active = true;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );

  @override
  Widget build(BuildContext context) {
    final produitController = context.watch<ProduitController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Couleurs.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const ListProduit()));
          },
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            color: Couleurs.blanc,
            size: 30,
          ),
        ),
        title: Center(
            child: Text(
          "Details de L'article",
          style: TextStyle(color: Couleurs.blanc),
        )),
      ),
      backgroundColor: const Color.fromARGB(239, 245, 242, 242),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 70),
                  width: MediaQuery.of(context).size.width,
                  height: 550,
                  child: Image.network(
                      'http://10.0.2.2/${produitController.currentProduit.photo}'),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20, bottom: 8, left: 20),
            // height: 40,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      _modalDetail();
                      // showBottomSheet(context: context, builder: (context) =>Container())
                    },
                    child: FaIcon(
                      Icons.info,
                      color: Couleurs.orange,
                      size: 40,
                    )),
                SvgPicture.asset(
                  'assets/icons/telecharger.svg',
                  height: 30,
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  void _modalDetail() {
    showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return // ::::::::::::::::::::::::::::::::;detail de l'image
              StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              final produitController = context.watch<ProduitController>();
              produit = produitController.currentProduit;
              couleursProduit = produitController.currentCouleursProduits;
              // List<L> couleursProduitSelect = 0;
              tailleProduit = produitController.currentTailleProduits;
              double montantintiale = produit.prix!;

              Provider.of<ProduitController>(context, listen: false)
                  .montantTotal = produit.prix!;
              return Container(
                padding: const EdgeInsets.all(10),
                height: 420,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Couleurs.gri),
                    color: Couleurs.blanc,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 5,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Couleurs.gri,
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                // :::::::::::::::::::::::nom
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  // decoration:
                                  //     BoxDecoration(border: Border.all(width: 1)),
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${produit.nom}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      Container(
                                        child: Text(
                                          "${produit.categories!.nom}",
                                          style:
                                              TextStyle(color: Couleurs.orange),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // ::::::::::::::::::::::::::::;tail
                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Taille",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Container(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: ListView.builder(
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: tailleProduit
                                                            .length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                index) {
                                                          final taille =
                                                              tailleProduit[
                                                                  index];
                                                          return InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                Provider.of<ProduitController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .updateSelectedTaille(
                                                                        index);
                                                                commande
                                                                    .tailleProduit = (Provider.of<
                                                                            ProduitController>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .slectedTaille);
                                                                print(
                                                                    '-------just taille--${commande.tailleProduit}');

                                                                toggleSelection2(
                                                                    index);
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 30,
                                                              height: 30,
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          10),
                                                              decoration: BoxDecoration(
                                                                  color: shapeSelectedTaille == index
                                                                      ? Couleurs
                                                                          .blanc
                                                                      : Couleurs
                                                                          .orange,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border.all(
                                                                      width: 1,
                                                                      color: Couleurs
                                                                          .gri)),
                                                              child: Center(
                                                                child: Text(
                                                                  "${taille.libelle}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: TextStyle(
                                                                      color: shapeSelectedTaille !=
                                                                              index
                                                                          ? Couleurs
                                                                              .blanc
                                                                          : Couleurs
                                                                              .orange),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Couleurs",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  // couleursProduitSelect = c;
                                                  Provider.of<ProduitController>(
                                                          context,
                                                          listen: false)
                                                      .updateSlelectedColor(0);
                                                  checkBoxColor = 1;
                                                });
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                            couleursProduit[0]
                                                                .libelle
                                                                .substring(
                                                                    1, 7),
                                                            radix: 16) +
                                                        0x80000000),
                                                    // shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Couleurs.gri)),
                                                child: checkBoxColor == 1
                                                    ? const Icon(Icons.check,
                                                        color: Colors
                                                            .white) // Your icon here
                                                    : null,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Provider.of<ProduitController>(
                                                          context,
                                                          listen: false)
                                                      .updateSlelectedColor(1);
                                                  checkBoxColor = 2;
                                                  print(Provider.of<
                                                              ProduitController>(
                                                          context,
                                                          listen: false)
                                                      .selectedColor);
                                                });
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                            couleursProduit[1]
                                                                .libelle
                                                                .substring(
                                                                    1, 7),
                                                            radix: 16) +
                                                        0x80000000),
                                                    // shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Couleurs.gri)),
                                                child: checkBoxColor == 2
                                                    ? const Icon(Icons.check,
                                                        color: Colors
                                                            .white) // Your icon here
                                                    : null,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 2,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Provider.of<ProduitController>(
                                                          context,
                                                          listen: false)
                                                      .updateSlelectedColor(2);
                                                  checkBoxColor = 3;
                                                });
                                              },
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                            couleursProduit[2]
                                                                .libelle
                                                                .substring(
                                                                    1, 7),
                                                            radix: 16) +
                                                        0x80000000),
                                                    // shape: BoxShape.circle,
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Couleurs.gri)),
                                                child: checkBoxColor == 3
                                                    ? const Icon(Icons.check,
                                                        color: Colors
                                                            .white) // Your icon here
                                                    : null,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // :::::::::::::::::::::::::::culture
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Culture",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                      Container(
                                        child: Text(
                                          "${produit.culture}",
                                          style:
                                              TextStyle(color: Couleurs.orange),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // :::::::::::::::::::::description
                              ],
                            ),
                          ),
                          // ::::::::::::::cote droit
                          Expanded(
                            flex: 4,
                            child: Container(
                              padding: const EdgeInsets.only(right: 15),
                              // decoration:
                              //     BoxDecoration(border: Border.all(width: 1)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Text(
                                      "$montantintiale FCFA",
                                      style: TextStyle(
                                          color: Couleurs.orange, fontSize: 22),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // :::::::::::::::::::;counter button
                                  Container(
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Provider.of<ProduitController>(
                                                    context,
                                                    listen: false)
                                                .updateCountMoin();

                                            // isShow = false;
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/icons/moin.svg',
                                            height: 20,
                                          ),
                                        ),
                                        Consumer<ProduitController>(
                                          builder: (context, value, child) {
                                            quantityChoisie = value.count;
                                            // isShow = m > 0;

                                            // print('-----show--${isShow}');

                                            return Text(
                                              '${value.count.toInt()}',
                                              style:
                                                  const TextStyle(fontSize: 22),
                                            );
                                          },
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Provider.of<ProduitController>(
                                                    context,
                                                    listen: false)
                                                .updateCount();
                                          },
                                          icon: SvgPicture.asset(
                                            'assets/icons/plus.svg',
                                            height: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // ::::::::::::::::::button acheter
                                  InkWell(
                                    onTap: () {
                                      print(
                                          '-----idpro---${produit.idProduit}');
                                      print(
                                          '-----quantity---${quantityChoisie}');
                                      produitProvider
                                          .achatProduit(produit.idProduit!,
                                              quantityChoisie)
                                          .then((value) {
                                        if (value.quantite != null) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const UtilisateurModePaiement()));
                                        }
                                      }).catchError((onError) {
                                        throw Exception("error:  + $onError");
                                      });
                                    },
                                    child: Container(
                                      width: 120,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Couleurs.gri),
                                          color: Couleurs.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Acheter",
                                          style: TextStyle(
                                              color: Couleurs.blanc,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: () async {
                                      commande = produitController.commande;
                                      commande.produits = produit;
                                      commande.couleursProduit =
                                          produitController.selectedColor;
                                      print(
                                          '---coul select---${commande.couleursProduit}  --------taille select${commande.tailleProduit}  ----user connecte${commande.utilisateur}');
                                      commande.tailleProduit =
                                          produitController.slectedTaille;
                                      artisanSharedPreference
                                          .getUserFromSharedPreference()
                                          .then((value) {
                                        commande.utilisateur = value;
                                        print(
                                            '---useer-- ${commande.utilisateur}');
                                      });
                                      artisanSharedPreference
                                          .getUserFromSharedPreference()
                                          .then((value) {
                                        print(value);
                                        if (value == null) {
                                          CommandePoppup().error(context);
                                        } else {
                                          commande.panier = value.panier!;
                                        }
                                      });
                                      commande.quantite = quantityChoisie;
                                      // commande.panier= artisanSharedPreference.getUserFromSharedPreference()
                                      await produitProvider
                                          .ajouterCommande(commande)
                                          .then((value) {
                                        CommandePoppup()
                                            .errorAjoutCommande(context);
                                      }).catchError((onError) {
                                        // CommandePoppup()
                                        //     .errorAjoutCommande(context);
                                      });

                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             const UtilisateurModePaiement()));
                                    },
                                    child: Visibility(
                                      visible: produitController.isActiveButton,
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 8),
                                        width: 120,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Couleurs.gri),
                                            color: Couleurs.orange,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Panier",
                                              style: TextStyle(
                                                  color: Couleurs.blanc,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            FaIcon(
                                              FontAwesomeIcons.cartShopping,
                                              color: Couleurs.blanc,
                                              size: 15,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      // ::::::::::::::::::::::::description
                      Container(
                        padding: const EdgeInsets.only(top: 10, left: 10),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Description",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                            ),
                            Container(
                              // padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "${produit.description}",
                                // style: TextStyle(),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  const Text(
                                    "Montant",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Consumer<ProduitController>(
                                    builder: (context, value, child) {
                                      print(
                                          '-----${value.montantTotal * value.count}');
                                      return Text(
                                        '${value.montantTotal * value.count.toInt()} : FCFA',
                                        style:
                                            TextStyle(color: Couleurs.orange),
                                      );
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
