import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/controller_mobil/profil_controller.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/accueil.dart';
import 'package:art_eshop/mobil/pages/artisan_notification.dart';
import 'package:art_eshop/mobil/pages/panier.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:art_eshop/mobil/pages/profil_utilisateur.dart';
import 'package:art_eshop/mobil/pages/utilisateur_culture.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigationExample extends StatefulWidget {
  const BottomNavigationExample({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavigationExampleState createState() =>
      _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State {
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();
  int _selectedTab = 0;
  Artisan? artisan = Artisan();
  bool selected = false;
//  final artisans = artisanSharedPreference.currentArtisan;

  List<Widget> pages = [];

  void getListPages() {
    pages = [
      const Accueil(),
      const UtilisateurCulture(),
      selected ? const Panier() : const ArtisanNotification(),
      const ProfilController(),
      const ArtisanNotification(),
    ];
  }

  _changeTab(int index) async {
     artisan =
        await artisanSharedPreference.getArtisanFromSharedPreference();
    if (artisan != null) {
      selected == false;
    } else {
      selected = true;
    }
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    getListPages();
    return Scaffold(
      body: pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Couleurs.orange,
        unselectedItemColor: Colors.grey,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/cult.svg',
                color: Couleurs.gri,
              ),
              label: "Culture"),
          BottomNavigationBarItem(
            icon: artisan?.idArtisans != null
                ? const FaIcon(
                    FontAwesomeIcons.bell,
                    // color: Colors.grey,
                  )
                : const FaIcon(
                    FontAwesomeIcons.cartShopping,
                    // color: Colors.grey,
                  ),
            label: _selectedTab == 2
                ? (artisan?.nom != null ? "Notification" : "Panier")
                : "",
          ),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
