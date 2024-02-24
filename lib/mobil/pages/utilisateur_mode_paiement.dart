import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/produit_detail.dart';
import 'package:art_eshop/mobil/pages/utilisateur_payement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UtilisateurModePaiement extends StatefulWidget {
  const UtilisateurModePaiement({super.key});

  @override
  State<UtilisateurModePaiement> createState() =>
      _UtilisateurModePaiementState();
}

class _UtilisateurModePaiementState extends State<UtilisateurModePaiement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      appBar: AppBar(
        backgroundColor: Couleurs.blanc,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
                // MaterialPageRoute(builder: (context) => const ProduitDetail()));
          },
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            color: Couleurs.orange,
            size: 30,
          ),
        ),
        title: Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            Container(
              child: const Text(
                "Mode de Paiement",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/card.png',
                    fit: BoxFit.cover,
                  )),
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 10),
                    child: const Center(
                        child: Text(
                      "Choisir un mode de paiement",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    )),
                  ),
                ],
              ),
              // :::::::::::::::orange money
              Container(
                height: 330,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Couleurs.orange,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UtilisateurPaiement()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Couleurs.gri),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: SvgPicture.asset(
                                'assets/icons/org.svg',
                                height: 30,
                              ),
                            ),
                            const Text(
                              "Orange Money",
                              style: TextStyle(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    // ::::::::::::::::::::::visa
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Couleurs.gri),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: SvgPicture.asset(
                                'assets/icons/visa.svg',
                                height: 20,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: const Text(
                                "Visa",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // :::::::::::::::::::::;
                    InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Couleurs.gri),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 10),
                              child: SvgPicture.asset(
                                'assets/icons/credit.svg',
                                height: 30,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: const Text(
                                "Carte de Credit",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
