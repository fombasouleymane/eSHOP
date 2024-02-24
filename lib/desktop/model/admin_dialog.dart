import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/desktop/pages/ajout_culture.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/services/categorie_service.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class PoppupAdmin {
  Categories category = Categories();
  // ProduitProvider produitProvider = ProduitProvider();
  CategorieService categorieService = CategorieService();
  void supprimePoppup(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(const Duration(seconds: 1), () {
          //   Navigator.of(context).pop(true);
          // });
          return Dialog(
            // insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                // padding: const EdgeInsets.only(top: 20),
                height: 210,
                width: 280,
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
                          "Voulez-vous vraiment supprimer cette Categorie de votre catalogue",
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
                              // produit = Provider.of<ProduitController>(context,
                              //         listen: false)
                              //     .produitAsupprimmer;
                              // produitProvider.(produit.idProduit!);
                              category = Provider.of<ProduitController>(context,
                                      listen: false)
                                  .mesCategorie;
                              categorieService
                                  .supprrimerCategorie(category.idCategorie!)
                                  .then((value) {
                                if (value != "success") {
                                  PoppupAdmin().errSuppression(context);
                                }
                              });
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

  void errSuppression(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(const Duration(seconds: 1), () {
          //   Navigator.of(context).pop(true);
          // });
          return Dialog(
            // insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                // padding: const EdgeInsets.only(top: 20),
                height: 190,
                width: 280,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Center(
                        child: Text(
                          "Error",
                          style: TextStyle(
                              fontSize: 24,
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
                          "Cette Categorie  ne peut pas etre supprimer en raison des Produits deja associer",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 4),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // InkWell(
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }

  void successArtisanActive(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return Dialog(
            // insetAnimationDuration: const Duration(seconds: 3),
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

  // ::::::::::::::::::::::::;poppup desactive
  void successArtisanDesactive(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).pop(true);
          });
          return Dialog(
            // insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                padding: const EdgeInsets.only(top: 20),
                height: 190,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Desactivation avec Succee",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SvgPicture.asset(
                      "icons/refuse.svg",
                      height: 100,
                    ),
                  ],
                )),
          );
        });
  }

  // :::::::::::::::::ajout culture poppup
  void ajoutCulture(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Couleurs.blanc),
                    borderRadius: BorderRadius.circular(10)),
                width: 505,
                // height: 550,
                child: const AjoutCulture()),
          );
        });
  }
}
