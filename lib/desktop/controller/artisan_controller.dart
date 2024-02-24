import 'package:art_eshop/desktop/pages/admin_produits_de_artisan.dart';
import 'package:art_eshop/desktop/pages/detail_artisan.dart';
import 'package:art_eshop/desktop/pages/list_artisan.dart';
import 'package:art_eshop/desktop/pages/admin_list_produit.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:flutter/material.dart';

import '../../mobil/services/artisan_service.dart';

class ArtisanController extends ChangeNotifier {
  List<StatefulWidget> pages = [];
  int indicePage = 0;

  Future<List<Artisan>> mesArtisans = ArtisanProvider().getData();

  Artisan currentArtisan = Artisan();
  List<Produit> currentProduit = [];

  StatefulWidget get page {
    return pages[indicePage];
  }

  ArtisanController() {
    pages = [
      const ListArtisan(),
      const DetailArtisan(),
      const AdminProduitListArtisan(),
    ];
  }

  gotoDetails() {
    indicePage = 1;
    notifyListeners();
  }

  gotoProduiList() {
    indicePage = 2;
    notifyListeners();
  }

  gotoListArtisan() {
    indicePage = 0;
    notifyListeners();
  }
}
