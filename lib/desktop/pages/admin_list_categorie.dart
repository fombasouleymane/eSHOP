import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/desktop/model/admin_dialog.dart';
import 'package:art_eshop/desktop/model/category_avec_produit.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/services/categorie_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListCategories extends StatefulWidget {
  const ListCategories({super.key});

  @override
  State<ListCategories> createState() => _ListCategoriesState();
}

class _ListCategoriesState extends State<ListCategories> {
  CategorieService service = CategorieService();
  Popup popup = Popup();
  List<CategorieWithProduit> categorieWithProduit = [];
  CategorieWithProduit categoryProduit = CategorieWithProduit();

  // CategorieService service = CategorieService();
  @override
  void initState() {
    super.initState();
    listCategoriAvecProduit();
    // passwordVisible = true;
  }

  Future<void> listCategoriAvecProduit() async {
    await service.getAllCategoriesadmin().then((value) {
      print(value);
      setState(() {
        categorieWithProduit = value;
      });
    }).catchError((err) {
      print(
          'Erreur lors de la récupération de la liste de categorie: ${err.toString()}');
      popup.success(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      body: Container(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          popup.ajouterCategories(context);
                        },
                        child: Container(
                            width: 125,
                            height: 30,
                            decoration: BoxDecoration(
                                color: Couleurs.orange,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                                child: Text(
                              "Ajouter",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Couleurs.blanc),
                            ))),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border.symmetric(
                        horizontal: BorderSide(width: 1, color: Couleurs.gri)),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Num",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                        Container(
                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Nom",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                        Container(

                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Nombre de Produits",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                        Container(

                            // padding: const EdgeInsets.all(3),
                            child: Text(
                          "Actions",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Couleurs.orange),
                        )),
                      ]),
                ),
                // ::::::::::::::::contenu
                Expanded(
                    child: ListView.builder(
                        itemCount: categorieWithProduit.length,
                        itemBuilder: (BuildContext context, index) {
                          final categoryProduit = categorieWithProduit[index];
                          return Container(
                            // padding: const EdgeInsets.only(left: 40, right: 40),
                            child: Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.symmetric(
                                    horizontal: BorderSide(
                                        width: 1, color: Couleurs.gri)),
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // contenue:::::::::::::::::::;
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(3),
                                            child: Column(
                                              children: [
                                                Text(
                                                  "${index + 1}",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            // padding: const EdgeInsets.all(3),
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${categoryProduit.category!.nom}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        )),
                                        Container(
                                            // padding: const EdgeInsets.all(3),
                                            child: Column(
                                          children: [
                                            Text(
                                              "${categoryProduit.productCount}",
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        )),
                                        Container(
                                            // padding: const EdgeInsets.all(3),
                                            child: Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  Provider.of<ProduitController>(
                                                              context)
                                                          .mesCategorie =
                                                      categoryProduit.category!;
                                                  PoppupAdmin()
                                                      .supprimePoppup(context);
                                                  // popup.success(context);
                                                  //   Navigator.push(
                                                  //       context,
                                                  //       MaterialPageRoute(
                                                  //           builder: (context) =>
                                                  //               const ArtisanModifierProduit()));
                                                },
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.penToSquare,
                                                  color: Colors.black,
                                                )),
                                            IconButton(
                                                onPressed: () {
                                                  Provider.of<ProduitController>(
                                                              context,
                                                              listen: false)
                                                          .mesCategorie =
                                                      categoryProduit.category!;
                                                  PoppupAdmin().supprimePoppup(context);
                                                  // print(Provider.of<
                                                  //             ProduitController>(
                                                  //         context)
                                                  //     .mesCategorie);
                                                },
                                                icon: const FaIcon(
                                                  FontAwesomeIcons.trashCan,
                                                  color: Colors.red,
                                                )),
                                          ],
                                        )),
                                      ]),
                                  // ::
                                ],
                              ),
                            ),
                          );
                        })),
              ],
            ),
          )),
    );
  }
}
