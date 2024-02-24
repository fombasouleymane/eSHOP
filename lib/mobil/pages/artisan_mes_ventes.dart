import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/commande_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtisanVentes extends StatefulWidget {
  const ArtisanVentes({super.key});

  @override
  State<ArtisanVentes> createState() => _ArtisanVentesState();
}

class _ArtisanVentesState extends State<ArtisanVentes> {
  Artisan artisan = Artisan();
  ProduitProvider produitProvider = ProduitProvider();
  List<Produit> produitsVendues = [];
  List<Commande> commands = [];
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();

  @override
  void initState() {
    super.initState();
    artisanSharedPreference.getArtisanFromSharedPreference().then((value) {
      if (value != null) {
        print(value);
        artisan = value;
        // isArtisan = true;
      } else {
        return null;
      }
      setState(() {});
    });
    fetchlistProduitArtisan();
  }

  Future<void> fetchlistProduitArtisan() async {
    artisanSharedPreference
        .getArtisanFromSharedPreference()
        .then((value) async {
      if (value != null) {
        artisan = value;
        await produitProvider.ventes(artisan.idArtisans!).then((value) {
          // if (value != null) {}
          print('-----list produit ventes--${value}');
          setState(() {
            commands = value;
          });
        }).catchError((err) {
          print(
              'Erreur lors de la récupération des produit  vendues de l\'artisan : $err');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Expanded(
                child: ListView.builder(
          itemCount: commands.length,
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, index) {
            final vente = commands[index];
            return InkWell(
              highlightColor: Couleurs.orange.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 110,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Couleurs.blanc,
                    border: Border(
                        bottom: BorderSide(width: 1, color: Couleurs.gri))
                    // borderRadius: BorderRadius.circular(10),
                    ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 6,
                      child: Row(
                        children: [
                          Container(
                              // margin: const EdgeInsets.all(8),
                              // height: 90,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Couleurs.gri),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Image.network(
                                  "http://10.0.2.2/${vente.produits!.photo}")),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      const Text("Nom:",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      // const SizedBox(
                                      //   width: 8,
                                      // ),
                                      Text(
                                        "${vente.produits!.nom}",
                                        style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    child: Row(
                                  children: [
                                    const Text("Quantite:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                      "${vente.quantite}",
                                      style: TextStyle(
                                        color: Couleurs.orange,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      const Text("Prix:",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                          "${vente.produits!.prix?.toInt()} FCFA",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Couleurs.orange)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 4, top: 20),
                            child: GestureDetector(
                                onTap: () {},
                                child: const FaIcon(
                                  FontAwesomeIcons.trashCan,
                                  color: Colors.red,
                                )),
                            // child: SvgPicture.asset('assets/icons/vect_droite.svg'),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [Text("${vente.date}")],
                            ),
                            // child: SvgPicture.asset('assets/icons/vect_droite.svg'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        )))
      ],
    );
  }
}
