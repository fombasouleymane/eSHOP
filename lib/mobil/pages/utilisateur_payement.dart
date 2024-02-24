import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/models/spinner_page.dart';
import 'package:art_eshop/mobil/pages/utilisateur_mode_paiement.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UtilisateurPaiement extends StatefulWidget {
  const UtilisateurPaiement({super.key});

  @override
  State<UtilisateurPaiement> createState() => _UtilisateurPaiementState();
}

class _UtilisateurPaiementState extends State<UtilisateurPaiement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      appBar: AppBar(
        backgroundColor: Couleurs.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // MaterialPageRoute(
            //     builder: (context) => const UtilisateurModePaiement()));
          },
          icon: FaIcon(
            FontAwesomeIcons.angleLeft,
            color: Couleurs.blanc,
            size: 30,
          ),
        ),
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(
              width: 70,
            ),
            Container(
              child: Text(
                "Paiement",
                style: TextStyle(
                    color: Couleurs.blanc,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: Container(
          child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 40, top: 20),
              child: const Text(
                "Paiment par Orange Money",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
              child: const Text(
                "Numero ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                // controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Numero*",
                  hintText: "Entree Votre numero orange",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  contentPadding: EdgeInsets.all(8.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ce champs est Obligatoir";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
              child: const Text(
                "Montant",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: 200,
              margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
              child: TextFormField(
                keyboardType: TextInputType.number,
                // controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Montant*",
                  hintText: "Entree le montant souhaitez",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  contentPadding: EdgeInsets.all(8.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ce champs est Obligatoir";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
              child: const Text(
                "Code de paiement",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, left: 40, right: 40),
              child: TextFormField(
                keyboardType: TextInputType.number,
                // controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Code de Paiement*",
                  hintText: "Entree Votre Code de paiement",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  contentPadding: EdgeInsets.all(8.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ce champs est Obligatoir";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // :::::::::::::::::::submit
            Row(
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SpinnerPage()));
                    showDialog(
                      context: context,
                      builder: (context) => Dialog.fullscreen(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    );
                    Future.delayed(Duration(seconds: 3), () {
                      Popup().successMobil(context);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 40),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Couleurs.orange,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Confirmer",
                        style: TextStyle(
                            color: Couleurs.blanc,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    // MaterialPageRoute(
                    //     builder: (context) =>
                    //         const UtilisateurModePaiement()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 40),
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Couleurs.orange),
                        color: Couleurs.blanc,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        "Annuler",
                        style: TextStyle(
                            color: Couleurs.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                width: 300,
                // height: 150,
                decoration: const BoxDecoration(
                    // color: Colors.black, shape: BoxShape.circle),
                    ),
                child: Image.asset(
                  'assets/images/orange.png',
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
