import 'package:art_eshop/desktop/pages/culture.dart';
import 'package:art_eshop/desktop/pages/detail_culture.dart';
import 'package:flutter/material.dart';

class CultureController extends ChangeNotifier{
  List<StatefulWidget> pages = [];
  int indexPage = 0;

  StatefulWidget get page{
    return pages[indexPage];
  }

  CultureController(){
    pages=[
      const Culture(),
      const DetailCultures(),

    ];
  }

  gotoDetails() {
    indexPage = 1;
    notifyListeners();
  }

  gotoListCulture() {
    indexPage = 0;
    notifyListeners();
  }
}