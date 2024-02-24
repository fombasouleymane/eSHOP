import 'package:art_eshop/desktop/controller/artisan_controller.dart';
import 'package:art_eshop/desktop/controller/artisan_controller.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AdminProduitListArtisan extends StatefulWidget {
  const AdminProduitListArtisan({super.key});

  @override
  State<AdminProduitListArtisan> createState() => _AdminListProduitState();
}

class _AdminListProduitState extends State<AdminProduitListArtisan> {
  Artisan artisan = Artisan();
  ProduitProvider produitProvider = ProduitProvider();
  List<Produit> produits = [];
  // Future<void> fetchlistProduitArtisan() async {
  //   artisanSharedPreference
  //       .getArtisanFromSharedPreference()
  //       .then((value) async {
  //     if (value != null) {
  //       artisan = value;
  //       await produitProvider
  //           .artisanlistProduit(artisan.idArtisans!)
  //           .then((value) {
  //         // if (value != null) {}
  //         print('-----list produit artisan--${value}');
  //         setState(() {
  //           produits = value;
  //         });
  //       }).catchError((err) {
  //         print(
  //             'Erreur lors de la récupération des produit de l\'artisan : $err');
  //       });
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    final artisanController = context.watch<ArtisanController>();

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            color: Couleurs.blanc,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Liste de Produits",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                // const SizedBox(
                //   width: 100,
                // ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Couleurs.orange),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        const Text('Catetegorie'),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.select_all))
                      ],
                    ))
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250.0,
                mainAxisExtent: 350,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 20.0,
              ),
              shrinkWrap: true,
              itemCount: artisanController.currentProduit.length,
              itemBuilder: (context, index) {
                final produit = artisanController.currentProduit[index];
                return InkWell(
                    borderRadius: BorderRadius.circular(10),
                    highlightColor: Couleurs.orange,
                    onTap: () {},
                    child: Container(
                      // height: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: Couleurs.gri, width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              // padding: const EdgeInsets.all(10),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Couleurs.gri, width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Image.network(
                                "http://127.0.0.1/${produit.photo}",
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${produit.nom}"),
                                  Text(
                                    "${produit.prix}",
                                    style: TextStyle(color: Couleurs.orange),
                                  ),
                                  Text("${produit.quantite}"),
                                  Text(
                                      "${produit.artisans!.nom}  ${produit.artisans!.prenom}"),
                                  Text("${produit.categories!.nom}"),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ));
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Couleurs.orange,
        elevation: 3,
        tooltip: "Retour",
        onPressed: () {
          artisanController.gotoDetails();
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
