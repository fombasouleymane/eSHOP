import 'package:art_eshop/desktop/controller/artisan_controller.dart';
import 'package:art_eshop/desktop/model/admin_dialog.dart';
import 'package:art_eshop/desktop/service/admin_service.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/services/artisan_service.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DetailArtisan extends StatefulWidget {
  const DetailArtisan({super.key});

  //final Artisan artisan;

  @override
  State<DetailArtisan> createState() => _DetailArtisanState();
}

class _DetailArtisanState extends State<DetailArtisan> {
  ArtisanProvider service = ArtisanProvider();
  ProduitProvider produitProvider = ProduitProvider();
  AdminService serviceAdmin = AdminService();
  ArtisantService artisantService = ArtisantService();
  @override
  Widget build(BuildContext context) {
    final artisanController = context.watch<ArtisanController>();
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      appBar: AppBar(
          leading: Container(),
          backgroundColor: Couleurs.blanc,
          // toolbarHeight: 70,
          flexibleSpace: Container(
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: Text(
                "Detail de l'Artisan",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Consumer<ArtisanController>(
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        width: 740,
                        height: 520,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Couleurs.gri),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 280,
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "${value.currentArtisan.nom} ${value.currentArtisan.nom}",
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          width: 280,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: value
                                                        .currentArtisan.active!
                                                    ? const Text(
                                                        "Active",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
                                                      )
                                                    : const Text(
                                                        "Non active",
                                                        style: TextStyle(
                                                            color: Colors.red),
                                                      ),
                                              ),
                                              Container(
                                                // width: 280,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    const Text(
                                                      "Voir ses articles",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    IconButton(
                                                        onPressed: (() {
                                                          produitProvider
                                                              .artisanlistProduit(value
                                                                  .currentArtisan
                                                                  .idArtisans!)
                                                              .then((value) {
                                                            artisanController
                                                                    .currentProduit =
                                                                value;
                                                            context
                                                                .read<
                                                                    ArtisanController>()
                                                                .gotoProduiList();
                                                          }).catchError(
                                                                  (onError) {
                                                            throw Exception(
                                                                "error");
                                                          });
                                                        }),
                                                        icon: Icon(
                                                          Icons.remove_red_eye,
                                                          color:
                                                              Couleurs.orange,
                                                        ))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.all(8.0),
                                      height: 280,
                                      width: 270,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Couleurs.gri)),
                                      child: Image.network(
                                        "http://127.0.0.1/${value.currentArtisan.photo!}",
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      width: 280,
                                      child: const Text(
                                        "Description",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 280,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  width: 1,
                                                  color: Couleurs.gri))),
                                      child:  Text("${value.currentArtisan.description}")),
                                  ],
                                )),
                              ],
                            ),
                            Container(
                              width: 1,
                              color: Couleurs.gri,
                              height: 580,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    // height: 400,
                                    padding: const EdgeInsets.all(10),
                                    width: 430,
                                    decoration: BoxDecoration(),
                                    child: const Text(
                                      "Entreprise",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    width: 430,
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    child: Text(
                                      value.currentArtisan.entreprise!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 430,
                                    decoration: BoxDecoration(),
                                    child: const Text(
                                      "Telephone",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    padding: const EdgeInsets.only(left: 10),
                                    width: 430,
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    child: Text(
                                      value.currentArtisan.telephone!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    width: 430,
                                    child: const Text(
                                      "Region",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: const EdgeInsets.only(left: 10),
                                    width: 430,
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    child: Text(
                                      value.currentArtisan.region!,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 430,
                                    child: const Text(
                                      "Sexe",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: const EdgeInsets.only(left: 10),
                                    width: 430,
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    child: Text(
                                      value.currentArtisan.sexe!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 430,
                                    decoration: const BoxDecoration(),
                                    child: const Text(
                                      "Administrateur",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    padding: const EdgeInsets.only(left: 10),
                                    width: 430,
                                    decoration: BoxDecoration(
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    child: const Text(
                                      "adama",
                                      // serviceAdmin.currentAdmin.nom,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: 408,
                                    child: InkWell(
                                      onTap: () async {
                                        Artisan artisan = value.currentArtisan;
                                        print('mooodia ${artisan}');

                                        await artisantService
                                            .activeOuDesactive(
                                                artisan.idArtisans!)
                                            .then((values) {
                                          setState(() {
                                            value.currentArtisan.active =
                                                !value.currentArtisan.active!;
                                          });
                                          // value.currentArtisan.active ? PoppupAdmin()
                                          //       .successArtisanActive(context): PoppupAdmin()
                                          //       .successArtisanActive(context);
                                          if (value.currentArtisan.active!) {
                                            PoppupAdmin()
                                                .successArtisanActive(context);
                                          } else {
                                            PoppupAdmin()
                                                .successArtisanDesactive(
                                                    context);
                                          }

                                          print('asdfghjkvbnm,');
                                        });
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Couleurs.orange,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Center(
                                          child: value.currentArtisan.active!
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
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  // Container(
                                  //   width: 408,
                                  //   child: InkWell(
                                  //     onTap: () {
                                  //       context
                                  //           .read<ArtisanController>()
                                  //           .gotoListArtisan();
                                  //     },
                                  //     child: Container(
                                  //       width: 100,
                                  //       height: 30,
                                  //       decoration: BoxDecoration(
                                  //           color: Couleurs.orange,
                                  //           borderRadius:
                                  //               BorderRadius.circular(8)),
                                  //       child: Center(
                                  //         child: Text(
                                  //           "Annuler",
                                  //           textAlign: TextAlign.center,
                                  //           style: TextStyle(
                                  //               color: Couleurs.blanc,
                                  //               fontSize: 17),
                                  //         ),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Couleurs.orange,
        elevation: 3,
        tooltip: "Retour",
        onPressed: () {
          artisanController.gotoListArtisan();
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
