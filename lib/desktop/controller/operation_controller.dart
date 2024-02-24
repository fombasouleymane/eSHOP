import 'package:art_eshop/desktop/model/admin_Entity.dart';
import 'package:art_eshop/desktop/pages/admin_list_categorie.dart';
import 'package:flutter/material.dart';

class OperationController extends ChangeNotifier {
  List<StatefulWidget> pages = [];
  int indexPage = 0;

  StatefulWidget get page {
    return pages[indexPage];
  }

  OperationController() {
    pages = [
      const ListCategories(),
    ];
  }

  Admin currentAdmin = Admin();

  gotoAjoutCategorie() {
    indexPage = 1;
    notifyListeners();
  }
}
