import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/couleur_Entity.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/pages/listProduit.dart';
import 'package:art_eshop/mobil/pages/produit_detail.dart';
import 'package:art_eshop/mobil/services/categorie_service.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _ProduitsState();
}

class _ProduitsState extends State<Accueil> {
  CategorieService service = CategorieService();
  ArtisanSharedPreference preference = ArtisanSharedPreference();
  TextEditingController searchController = TextEditingController();
  Artisan artisan = Artisan();
  Utilisateur utilisateur = Utilisateur();
  bool? isArtisan;
  List<Categories> categories = [];
  List<Produit> filteredProducts = [];
  Categories? selectedCategory;
  ProduitProvider produitProvider = ProduitProvider();
  List<Produit> products = [];

  @override
  void initState() {
    super.initState();
    // Appeler une méthode pour récupérer les catégories
    _fetchCategories();
    fetchlistProduitPublier();
    preference.getArtisanFromSharedPreference().then((value) async {
      if (value != null) {
        print(value);
        print("artisan");
        artisan = value;
        isArtisan = true;
      } else {
        await preference.getUserFromSharedPreference().then((value) {
          print(value);
          print("user");
          utilisateur = value!;
          isArtisan = false;
        });
      }
      setState(() {});
    }).catchError((err) {
      print('Erreur  : $err');
    });
  }

  Future<void> fetchlistProduitPublier() async {
    await produitProvider.getAllProduitPublier().then((value) {
      // if (value != null) {}
      print('-----list produit mobile--${value}');
      setState(() {
        products = value;
      });
    }).catchError((err) {
      print('Erreur lors de la récupération des produitpublier : $err');
    });
  }

  Future<void> _fetchCategories() async {
    await service.getAllCategories().then((value) {
      setState(() {
        categories = value;
      });
    }).catchError((err) {
      print('Erreur lors de la récupération des catégories : $err');
    });
  }

  @override
  Widget build(BuildContext context) {
    final produitController = context.watch<ProduitController>();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Couleurs.orange,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Couleurs.orange,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(40))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          // Popup().dialogLang(context);
                        },
                        child: SvgPicture.asset(
                            'assets/icons/google_translate.svg')),
                    Center(
                      child: isArtisan == null
                          ? CircularProgressIndicator(
                              backgroundColor: Couleurs.orange,
                            )
                          : isArtisan!
                              ? Text(
                                  "${artisan.nom}  ${artisan.prenom}",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  "${utilisateur.nom}  ${utilisateur.prenom}",
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                    ),
                    CircleAvatar(
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
                                  backgroundColor: Couleurs.blanc,
                                  child: Text(
                                    "${utilisateur.nom!.substring(0, 1)} ${utilisateur.prenom!.substring(0, 1)}",
                                    style: TextStyle(
                                        color: Couleurs.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
                                ),

                      // backgroundImage: AssetImage("assets/images/profil.png"),
                    ),
                  ],
                ),
              ),
            ),
            // :::::::::::::::::::::
            Container(
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              // decoration:  BoxDecoration( border: Border),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    filteredProducts = products
                        .where((produit) => produit.nom!
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                    prefixIconColor: Couleurs.orange,
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Recherche",
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    contentPadding: const EdgeInsets.all(0)),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                    child: const Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ]),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    final category = categories[index];
                    return InkWell(
                        highlightColor: Couleurs.orange.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[
                                index]; // Mettre à jour la catégorie sélectionnée
                          });
                        },
                        child: Container(
                          // padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 10),
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Couleurs.orange),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Text(
                              category.nom!,
                              textAlign: TextAlign.center,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ));
                  }),
            ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Articles recement ajouter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: GridView.builder(
                padding: const EdgeInsets.all(8),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 20.0,
                ),
                shrinkWrap: true,
                itemCount: products
                    .where((produit) =>
                        selectedCategory == null ||
                        produit.categories == selectedCategory &&
                            (searchController.text.isEmpty ||
                                produit.nom!.toLowerCase().contains(
                                    searchController.text.toLowerCase())))
                    .length,
                itemBuilder: (context, index) {
                  final produit = products
                      .where((produit) =>
                          selectedCategory == null ||
                          produit.categories == selectedCategory &&
                              (searchController.text.isEmpty ||
                                  produit.nom!.toLowerCase().contains(
                                      searchController.text.toLowerCase())))
                      .toList()[index];
                  return InkWell(
                    highlightColor: Couleurs.orange,
                    onTap: () {
                      produitProvider
                          .fetchProduitInformation(
                        produit.idProduit!,
                      )
                          .then((value) {
                        context.read<ProduitController>().currentProduit =
                            Produit.fromMap(value['produits']);
                        List<dynamic> list = value['tailles'];
                        List<TailleProduit> tailleProdu =
                            list.map((e) => TailleProduit.fromMap(e)).toList();
                        context
                            .read<ProduitController>()
                            .currentTailleProduits = tailleProdu;
                        print(tailleProdu);
                        List<dynamic> listcoul = value['produitsCouleur'];
                        print('------list-couleurMobil---${listcoul}');
                        List<CouleursProduit> listcouleurs = listcoul
                            .map((e) => CouleursProduit.fromMap(e))
                            .toList();
                        context
                            .read<ProduitController>()
                            .currentCouleursProduits = listcouleurs;
                        print('--------la list fro;Map----${listcouleurs}');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProduitDetail()));
                      });
                    },
                    child: Card(
                      // color: Couleurs.orange,
                      elevation: 8,
                      shadowColor: Colors.black,

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Couleurs.orange, width: 1)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Image.network(
                              "http://10.0.2.2/${produit.photo}",
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(left: 5, top: 5),
                              decoration: BoxDecoration(
                                  color: Couleurs.orange,
                                  borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.,
                                children: [
                                  Text(
                                    "Nom : ${produit.nom}",
                                    style: TextStyle(
                                        color: Couleurs.blanc,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    "Categorie : ${produit.categories!.nom}",
                                    style: TextStyle(
                                        color: Couleurs.blanc,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
