import 'package:art_eshop/mobil/pages/artisan_mes_ventes.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:flutter/material.dart';

class ArtisanProfilController extends ChangeNotifier {
  List<StatefulWidget> pages = [];
  int indicePage = 0;

  // Future<List<Artisan>> mesArtisans = ArtisanProvider().getData();

  // late Artisan currentArtisan;

  StatefulWidget get page {
    return pages[indicePage];
  }

  ArtisanProfilController() {
    pages = [
      const ArtisanProfil(),
      const ArtisanVentes(),
    ];
  }

  gotoArtisanProfilVente() {
    indicePage = 1;
    notifyListeners();
  }

  

  gotoProfilProduitArtisan() {
    indicePage = 0;
    notifyListeners();
  }
}
