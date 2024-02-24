import 'package:art_eshop/desktop/model/category_avec_produit.dart';
import 'package:art_eshop/desktop/pages/admin_list_produit.dart';
import 'package:art_eshop/desktop/pages/detail_produit.dart';
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/Produit_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:art_eshop/mobil/models/commande_Entity.dart';
import 'package:art_eshop/mobil/models/couleur_Entity.dart';
import 'package:art_eshop/mobil/services/produit_service.dart';
import 'package:flutter/material.dart';

class ProduitController extends ChangeNotifier {
  List<StatefulWidget> pages = [];
  int indicePage = 0;

  //////////////
  double quantityChoisie = 0.0;
  double count = 0;
  double montantInit = 0;
  double montantTotal = 0;
  bool isActiveButton = false;
  //////////////

  CouleursProduit selectedColor = CouleursProduit(libelle: "");
  TailleProduit slectedTaille = TailleProduit();

  Future<List<Produit>> mesProduis = ProduitProvider().getDataProduits();
  List<Produit> mesProduisMobile = [];

  Produit currentProduit = Produit();
  Commande commande = Commande();
  Produit produitAsupprimmer = Produit();

  List<TailleProduit> currentTailleProduits = [];
  List<CouleursProduit> currentCouleursProduits = [];
  Categories mesCategorie = Categories();

  // Future<Map<String, dynamic>> produitsComplet =
  //     ProduitProvider().fetchProduitInformation(idProduit);

  StatefulWidget get page {
    return pages[indicePage];
  }

  ProduitController() {
    pages = [
      const AdminListProduit(),
      const DetailProduit(),
    ];
  }

  gotoDetails() {
    indicePage = 1;
    notifyListeners();
  }

  gotoListProduit() {
    indicePage = 0;
    notifyListeners();
  }

  updateCount() {
    count++;
    if (count > 0) {
      isActiveButton = true;
    }
    montantTotal = count * montantInit;
    notifyListeners();
  }

  updateCountMoin() {
    count--;
    if (count <= 0) {
      isActiveButton = false;
    }
    montantTotal = count * montantInit;
    notifyListeners();
  }

  get isActiveToggle => isActiveButton;
  set isActiveButtons(bool value) {
    isActiveButton = value;
    notifyListeners();
  }

  updateSlelectedColor(int index) {
    selectedColor = currentCouleursProduits[index];
  }

  // taille selectionner
  updateSelectedTaille(int index) {
    slectedTaille = currentTailleProduits[index];
  }
}
