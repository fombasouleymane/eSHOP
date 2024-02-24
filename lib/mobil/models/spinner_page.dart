import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/accueil.dart';
import 'package:art_eshop/mobil/pages/listProduit.dart';
import 'package:art_eshop/mobil/pages/utilisateur_payement.dart';
import 'package:flutter/material.dart';

class SpinnerPage extends StatefulWidget {
  const SpinnerPage({super.key});

  @override
  State<SpinnerPage> createState() => _SpinnerPageState();
}

class _SpinnerPageState extends State<SpinnerPage> {
  @override
  void initState() {
    super.initState();
    _delayedFunction();
  }

  void _delayedFunction() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {});
        _navigateToAccueil();
      }
    });
  }

  void _navigateToAccueil() {
    popup.successMobil(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Accueil()));
  }

  Popup popup = Popup();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Couleurs.blanc,
        body: Center(
          child: CircularProgressIndicator(color: Couleurs.orange),
        ));
  }
}
