import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/commande_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Panier extends StatefulWidget {
  const Panier({super.key});

  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
  ProduitProvider produitProvider = ProduitProvider();
  List<Commande> commades = [];
  Utilisateur utilisateur = Utilisateur();
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();

  @override
  void initState() {
    fetchlistCommande();

    super.initState();
  }

  Future<void> fetchlistCommande() async {
    artisanSharedPreference.getUserFromSharedPreference().then((value) async {
      if (value != null) {
        utilisateur = value;
        await produitProvider
            .listCommandeUser(utilisateur.idUser!)
            .then((value) {
          // if (value != null) {}
          print('-----list commande pour user--${value}');
          setState(() {
            commades = value;
          });
        }).catchError((err) {
          print(
              'Erreur lors de la récupération des commande pour panier : $err');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Mon Panier",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Couleurs.blanc),
          ),
        ),
        // leading: ,
        elevation: 0,
        backgroundColor: Couleurs.orange,
      ),
      body: Container(
          child: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image.asset('assets/images/pan.png')),
          Expanded(
              child: ListView.builder(
            itemCount: commades.length,
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, index) {
              final commande = commades[index];
              return InkWell(
                highlightColor: Couleurs.orange.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 120,
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
                        flex: 8,
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
                                    "http://10.0.2.2/${commande.produits!.photo}")
                                // Image.asset("assets/images/plover1.png"),
                                ),
                            const SizedBox(
                              width: 15,
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
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "${commande.produits!.nom}",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
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
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      Text(
                                        "${commande.produits!.quantite}",
                                        style: TextStyle(
                                          color: Couleurs.orange,
                                          fontSize: 14,
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
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            "${commande.produits!.prix!.toInt()} FCFA",
                                            style: TextStyle(
                                                fontSize: 14,
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
                        flex: 3,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(right: 8, top: 3),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: const FaIcon(
                                    FontAwesomeIcons.trashCan,
                                    color: Colors.red,
                                  )),
                              // child: SvgPicture.asset('assets/icons/vect_droite.svg'),
                            ),
                            Text(
                              "${commande.date}",
                            ),
                            GestureDetector(
                                onTap: (() {}),
                                child: const Text(
                                  "Acheter",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}
