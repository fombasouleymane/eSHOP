import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/pages/ajouter_produit.dart';
import 'package:art_eshop/mobil/pages/artisan_inscription.dart';
import 'package:art_eshop/mobil/pages/artisan_mes_ventes.dart';
import 'package:art_eshop/mobil/pages/artisan_modifier_produit.dart';
import 'package:art_eshop/mobil/pages/artisan_notification.dart';
import 'package:art_eshop/mobil/pages/information_profil_artisan.dart';
import 'package:art_eshop/mobil/pages/profil_utilisateur.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ArtisanProfil extends StatefulWidget {
  const ArtisanProfil({super.key});

  @override
  State<ArtisanProfil> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ArtisanProfil> {
  List<Widget> pages = [];
  bool? isArtisan;
  int selectedIndex = 0;
  Artisan artisan = Artisan();
  ProduitProvider produitProvider = ProduitProvider();
  List<Produit> produits = [];

  late Utilisateur utilisateur;
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();
  void selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool isSelected = false;
  bool isSelected1 = false;

  void toggleSelection1() {
    setState(() {
      isSelected = !isSelected; // Inversion de l'état de la sélection
    });
  }

  void toggleSelection() {
    setState(() {
      isSelected1 = !isSelected1; // Inversion de l'état de la sélection
    });
  }

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

// final artisanId = artisanSharedPreference.getArtisanFromSharedPreference();
  Future<void> fetchlistProduitArtisan() async {
    artisanSharedPreference
        .getArtisanFromSharedPreference()
        .then((value) async {
      if (value != null) {
        artisan = value;
        await produitProvider
            .artisanlistProduit(artisan.idArtisans!)
            .then((value) {
          // if (value != null) {}
          print('-----list produit artisan--${value}');
          setState(() {
            produits = value;
          });
        }).catchError((err) {
          print(
              'Erreur lors de la récupération des produit de l\'artisan : $err');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ProduitController produitController =
        context.watch<ProduitController>();
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.angleLeft,
              color: Couleurs.blanc,
              size: 30,
            ),
          ),
          actions: [
            Center(
              child: Container(
                // width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(right: 70),
                child: Text(
                  "Profil",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Couleurs.blanc),
                ),
              ),
            ),
            const SizedBox(
              width: 40,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const InformationProfilArtisan()));
                },
                icon: Icon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: Couleurs.blanc,
                ))
          ],
        ),
        body: Column(children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Couleurs.orange,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(70))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Couleurs.blanc,
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Couleurs.blanc),
                  ),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Couleurs.blanc,
                    // color: Couleurs.blanc,
                    child: isArtisan == null
                        ? Container()
                        : isArtisan!
                            ? Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Couleurs.blanc),
                                    shape: BoxShape.circle),
                                // backgroundColor: Couleurs.blanc,
                                child: Image.network(
                                  fit: BoxFit.fill,
                                  "http://10.0.2.2/${artisan.photo}",
                                ),
                              )
                            : CircleAvatar(
                                child: Text(
                                    "${utilisateur.nom!.substring(01)} ${utilisateur.prenom!.substring(01)}")),
                    // backgroundImage: AssetImage("assets/images/profil.png"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${artisan.nom} ${artisan.prenom}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Couleurs.blanc),
                    textAlign: TextAlign.center,
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ArtisanNotification()));
                    },
                    icon: Icon(
                      FontAwesomeIcons.bell,
                      color: Couleurs.blanc,
                    ))
              ],
            ),
          ),
          // ::::::::::::::::::::bare de recherche
          Row(
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.all(20),
                width: 230,
                // decoration:  BoxDecoration( border: Border),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIconColor: Couleurs.orange,
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Recherche",
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      contentPadding: const EdgeInsets.all(0)),
                ),
              ),
              InkWell(
                onTap: () async {
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AjouterProduit(),
                      ));
                  setState(() {});
                },
                child: Container(
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Couleurs.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Ajouter",
                      style: TextStyle(
                          color: Couleurs.blanc,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      // changeColors1();
                      toggleSelection1();
                    });
                  },
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.only(bottom: 8, right: 10),
                    child: Text(
                      "Mes Produits",
                      style: TextStyle(
                        fontSize: 18,
                        color: isSelected ? Couleurs.orange : Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      // changeColors1();
                      toggleSelection1();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 8, left: 10),
                    child: Text(
                      "Mes Ventes",
                      style: TextStyle(
                        fontSize: 18,
                        color: !isSelected ? Couleurs.orange : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          isSelected
              ? Expanded(
                  child: ListView.builder(
                  itemCount: produits.length,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (BuildContext context, index) {
                    final produit = produits[index];
                    produitController.produitAsupprimmer = produit;
                    return Container(
                      padding: const EdgeInsets.all(5),
                      height: 100,
                      // width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Couleurs.blanc,
                          border: Border(
                              bottom: BorderSide(width: 1, color: Couleurs.gri))
                          // borderRadius: BorderRadius.circular(10),
                          ),
                      child: Expanded(
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
                                      border: Border.all(
                                          width: 1, color: Couleurs.gri),
                                      borderRadius: BorderRadius.circular(6),
                                    ),

                                    child: Image.network(
                                        "http://10.0.2.2/${produit.photo}"),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              const Text("Nom:",
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "${produit.nom}",
                                                style: const TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                              "${produit.quantite}",
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
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text("${produit.prix} FCFA",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                              child: Container(
                                margin:
                                    const EdgeInsets.only(right: 0, top: 17),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: const FaIcon(
                                              FontAwesomeIcons.penToSquare,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Popup()
                                                    .supprimerMobile(context);

                                                // produitProvider
                                                //     .supprrimer(
                                                //         produit.idProduit!)
                                                //     .then((value) {});
                                                // setState(() {});
                                              },
                                              child: const FaIcon(
                                                FontAwesomeIcons.trashCan,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text("${produit.date}")
                                  ],
                                ),
                                // child: SvgPicture.asset('assets/icons/vect_droite.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ))
              : Expanded(
                  child: Container(
                    decoration: const BoxDecoration(),
                    child: const ArtisanVentes(),
                  ),
                )
        ])
        // : const UtilisateurProfil(),
        );
  }
}
