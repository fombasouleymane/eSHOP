import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommandePoppup {
  void errorAjoutCommande(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(const Duration(seconds: 1), () {
          //   Navigator.of(context).pop(true);
          // });
          return Dialog(
            // insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                // padding: const EdgeInsets.only(l),
                height: 270,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      color: const Color.fromARGB(255, 139, 244, 54),
                      child: Center(
                          child: Text(
                        "Success",
                        style: TextStyle(color: Couleurs.blanc,fontSize: 22),
                      )),
                    ),
                    const Text(
                      "Une Erreur se produit",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SvgPicture.asset(
                    //   "assets/icons/refuse.svg",
                    //   height: 100,
                    // ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Couleurs.orange,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "OK",
                              style: TextStyle(
                                  color: Couleurs.blanc,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }
  void successAjoutCommande(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(const Duration(seconds: 1), () {
          //   Navigator.of(context).pop(true);
          // });
          return Dialog(
            // insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                // padding: const EdgeInsets.only(l),
                height: 270,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40,
                      color: const Color.fromARGB(255, 6, 133, 2),
                      child: Center(
                          child: Text(
                        "Success",
                        style: TextStyle(color: Couleurs.blanc,fontSize: 22),
                      )),
                    ),
                    const Text(
                      "Commande ajouter avec succes",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SvgPicture.asset(
                    //   "assets/icons/refuse.svg",
                    //   height: 100,
                    // ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Couleurs.orange,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "OK",
                              style: TextStyle(
                                  color: Couleurs.blanc,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }
  // :::::::::::::::::::::::::::::::::::::::;;
  void error(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          // Future.delayed(const Duration(seconds: 1), () {
          //   Navigator.of(context).pop(true);
          // });
          return Dialog(
            // insetAnimationDuration: const Duration(seconds: 3),
            child: Container(
                // padding: const EdgeInsets.only(l),
                height: 270,
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      color: Colors.red,
                      child: Center(
                          child: Text(
                        "Error",
                        style: TextStyle(color: Couleurs.blanc,fontSize: 22),
                      )),
                    ),
                    const Text(
                      "Erreur vous n'est pouvait pas ajouter votre propre produit dans un panier",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SvgPicture.asset(
                    //   "assets/icons/refuse.svg",
                    //   height: 100,
                    // ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Couleurs.orange,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "OK",
                              style: TextStyle(
                                  color: Couleurs.blanc,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
