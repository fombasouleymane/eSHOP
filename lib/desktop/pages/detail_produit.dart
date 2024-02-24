import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/desktop/model/admin_dialog.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/controller_mobil/drapdawn_taille_selection.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/couleur_Entity.dart';
import 'package:art_eshop/mobil/services/categorie_service.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/network_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';

class DetailProduit extends StatefulWidget {
  const DetailProduit({super.key});

  @override
  State<DetailProduit> createState() => _DetailProduitState();
}

class _DetailProduitState extends State<DetailProduit> {
  // late Future<List<Categories>> _categories;
  Categories categories = Categories();
  ProduitProvider produitProvider = ProduitProvider();

  //  List<TailleProduit> tailleList = ;
  //  List<CouleursProduit> couleursList;

  @override
  void initState() {
    // _categories = CategorieService().getAllCategoriesadmin();
    super.initState();
    // print("------------4444----${widget.tailleList}");
  }

  @override
  Widget build(BuildContext context) {
    final produitController = context.watch<ProduitController>();
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Couleurs.blanc,
        title: Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              "Le Detail du Produit",
              style: TextStyle(
                  color: Couleurs.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      backgroundColor: Couleurs.blanc,
      body: Center(
        child: Consumer<ProduitController>(builder: (context, value, child) {
          print('${value.currentCouleursProduits}------value setailed----');
          return Container(
            width: 600,
            height: 490,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Couleurs.gri),
                borderRadius: BorderRadius.circular(15)),
            // color: Colors.amber,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      // color: Colors.amber,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Couleurs.gri),
                                borderRadius: BorderRadius.circular(8)),
                            child: Stack(children: [
                              Container(
                                  //   width: 300,
                                  //   height: 380,
                                  child: Image.network(
                                "http://127.0.0.1/${value.currentProduit.photo}",
                              )),
                              Positioned(
                                bottom: 0,
                                child: Row(
                                  children: [
                                    // ElevatedButton(
                                    //     // style: ButtonStyle(),
                                    //     onPressed: () {},
                                    //     child: const Text('Arriere-plan')),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: value.currentProduit.publier!
                                          ? const Text(
                                              "Publier",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            )
                                          : const Text(
                                              "Non Publier",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Description"),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(width: 1, color: Couleurs.gri)),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "${value.currentProduit.description}",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Prix : ${value.currentProduit.prix} FCFA",
                                  style: TextStyle(color: Couleurs.orange),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Nom"),
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 20),
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Couleurs.gri),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text("${value.currentProduit.nom}"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Categorie"),
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 20),
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Couleurs.gri),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                  "${value.currentProduit.categories!.nom!}."),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Date"),
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 20),
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Couleurs.gri),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text("${value.currentProduit.date}"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Quantite"),
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 20),
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Couleurs.gri),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text("${value.currentProduit.quantite}"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Culture"),
                            Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.only(right: 20),
                              height: 30,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Couleurs.gri),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text("${value.currentProduit.culture}"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Taille disponible"),
                              Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.only(right: 20),
                                  height: 30,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Couleurs.gri),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: DropdownButton<TailleProduit>(
                                    items: value.currentTailleProduits
                                        .map((TailleProduit taille) {
                                      return DropdownMenuItem<TailleProduit>(
                                        value: taille,
                                        child: Text(taille.libelle!),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      // No action required on change as it's read-only
                                    },
                                  )),
                            ],
                          ),
                        ),
                        // :::::::::::::::;couleurs
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.only(top: 15, bottom: 3),
                                child: const Text("Couleurs disponible"),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Color(int.parse(
                                                  value
                                                      .currentCouleursProduits[
                                                          0]
                                                      .libelle
                                                      .substring(1, 7),
                                                  radix: 16) +
                                              0x80000000),
                                          border: Border.all(
                                              width: 1, color: Couleurs.gri)),
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                          color: Color(int.parse(
                                                  value
                                                      .currentCouleursProduits[
                                                          1]
                                                      .libelle
                                                      .substring(1, 7),
                                                  radix: 16) +
                                              0x80000000),
                                          border: Border.all(
                                              width: 1, color: Couleurs.gri)),
                                      height: 30,
                                      width: 30,
                                    ),
                                  ),
                                  InkWell(
                                    child: Container(
                                      // margin:
                                      //     const EdgeInsets.only(left: 40, right: 40),
                                      decoration: BoxDecoration(
                                          color: Color(int.parse(
                                                  value
                                                      .currentCouleursProduits[
                                                          2]
                                                      .libelle
                                                      .substring(1, 7),
                                                  radix: 16) +
                                              0x80000000),
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
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10),
                                  onTap: () {
                                    produitProvider
                                        .rejeterProduit(
                                            value.currentProduit.idProduit!)
                                        .then((values) {});
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 4,
                                          bottom: 4,
                                          left: 20,
                                          right: 20),
                                      decoration: BoxDecoration(
                                          color: Couleurs.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          "Rejeter",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Couleurs.blanc),
                                        ),
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    produitProvider
                                        .pubilerProduit(
                                            value.currentProduit.idProduit!)
                                        .then((values) {
                                      print('-------active-----${value}');
                                      setState(() {
                                        value.currentProduit.publier =
                                            !value.currentProduit.publier!;
                                      });
                                      if (value.currentProduit.publier!) {
                                        PoppupAdmin()
                                            .successArtisanActive(context);
                                      } else {
                                        PoppupAdmin()
                                            .successArtisanDesactive(context);
                                      }
                                    });
                                  },
                                  child: Container(
                                      // width: 120,
                                      padding: const EdgeInsets.only(
                                          top: 4,
                                          bottom: 4,
                                          left: 20,
                                          right: 20),
                                      // height: 25,
                                      decoration: BoxDecoration(
                                          color: Couleurs.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: value.currentProduit.publier!
                                            ? Text(
                                                "Desactiver",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Couleurs.blanc,
                                                    fontSize: 17),
                                              )
                                            : Text(
                                                "Activer",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Couleurs.blanc,
                                                    fontSize: 17),
                                              ),
                                      )),
                                ),
                              )
                            ],
                          ),
                        )
                      ]),
                      // color: const Color.fromARGB(255, 19, 18, 17),
                    )),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Couleurs.orange,
        elevation: 3,
        tooltip: "Retour",
        onPressed: () {
          produitController.gotoListProduit();
        },
        child: Center(
            child: FaIcon(
          Icons.arrow_back,
          color: Couleurs.blanc,
          size: 18,
        )),
      ),
    );
  }
}
