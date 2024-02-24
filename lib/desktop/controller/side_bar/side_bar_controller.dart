// import 'package:faker/faker.dart';
// import 'package:fluent/home/home_page.dart';
// import 'package:fluent/parametre/parametre_page.dart';
import 'package:art_eshop/desktop/controller/pages_controller/pages_controller.dart';
import 'package:art_eshop/desktop/pages/admin_list_taille.dart';
import 'package:art_eshop/desktop/pages/dasboard.dart';
import 'package:art_eshop/desktop/pages/admin_list_produit.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideBarController extends ChangeNotifier {
  bool isExtended;
  int index;

  SideBarController({
    this.isExtended = true,
    this.index = 0,
  });

  void toggleNavigation() {
    isExtended = !isExtended;
    notifyListeners();
  }

  void changePage(int value) {
    index = value;
    notifyListeners();
  }

  late Widget navigationRail;

  final pages = [
    const Dashboard(),
    const ProduitPage(),
    const ArtisanPage(),
    const CulturePage(),
    const OperationPage(),
    const ListTaille(),
  ];

  Widget get page {
    return pages[index];
  }

  initNavigationRail() {
    navigationRail = Container(
      color: Couleurs.blanc,
      child: NavigationRail(
        minExtendedWidth: 150,
        // labelType: ,
        backgroundColor: Couleurs.orange,
        extended: isExtended,
        // selectedIconTheme: IconThemeData(color: Colors.amber),
        leading: Column(
          children: [
            Text(
              "ArtEshop",
              style: TextStyle(
                  color: Couleurs.blanc,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              radius: 50,
              child: SvgPicture.asset(
                "assets/icons/log.svg",
                height: 200,
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
        onDestinationSelected: changePage,
        destinations: [
          NavigationRailDestination(
            icon: const Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            label: Text(
              "Dashboard",
              style: TextStyle(color: Couleurs.blanc),
            ),
          ),
          NavigationRailDestination(
            icon: SvgPicture.asset(
              'assets/icons/product.svg',
              color: Colors.black,
            ),
            label: Text(
              "Produits",
              style: TextStyle(color: Couleurs.blanc),
            ),
          ),
          NavigationRailDestination(
            icon:
                SvgPicture.asset('assets/icons/artis.svg', color: Colors.black),
            label: Text(
              "Artisans",
              style: TextStyle(color: Couleurs.blanc),
            ),
          ),
          NavigationRailDestination(
            icon:
                SvgPicture.asset('assets/icons/cult.svg', color: Colors.black),
            label: Text(
              "Cultures",
              style: TextStyle(color: Couleurs.blanc),
            ),
          ),
          NavigationRailDestination(
            icon: SvgPicture.asset(
              'assets/icons/categories.svg',
              height: 30,
              // color: Couleurs.blanc,
            ),
            label: Text(
              "Categories",
              style: TextStyle(color: Couleurs.blanc),
            ),
          ),
          NavigationRailDestination(
            icon: SvgPicture.asset(
              'assets/icons/type.svg',
              // color: Couleurs.blanc,
              height: 30,
            ),
            label: Text(
              "Tailles",
              style: TextStyle(color: Couleurs.blanc),
            ),
          ),
        ],
        selectedIndex: index,
      ),
    );
  }
}
