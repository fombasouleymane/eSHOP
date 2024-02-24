import 'package:art_eshop/desktop/pages/admin_connexion.dart';
import 'package:art_eshop/desktop/pages/detail_artisan.dart';
import 'package:art_eshop/desktop/pages/picker_image.dart';
import 'package:art_eshop/desktop/pages/list_artisan.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/pages/inscription.dart';
import 'package:art_eshop/mobil/services/artisan_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int topIndex = 0;
  Artisan artisan = Artisan();

  // Liste des items de navigation
  List<Widget> items = [];
  List<Widget> pages = [
    const Connexion(),
    const ListArtisan(),
    const DetailArtisan(),
  ];

  void onPageChanged(int index) {
    Provider.of<ArtisantService>(context, listen: false)
        .changeIndex(index, null);
  }

  @override
  void initState() {
    super.initState();
    print(Provider.of<ArtisantService>(context, listen: false).artisan.nom);
    // Initialisation de la liste d'items ici
    
    items = [
      ListTile(
        title: Container(
          padding: const EdgeInsets.only(left: 8, right: 8),
          decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: topIndex == 0 ? Colors.white : Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              Icon(
                Icons.dashboard,
                color: Couleurs.blanc,
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                  color: Couleurs.blanc,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          onPageChanged(0);
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.dashboard_rounded,
          size: 18,
          color: Colors.white,
        ),
        title: Container(
          decoration: BoxDecoration(border: Border.all(width: 1)),
          child: Text(
            'Achats',
            style: TextStyle(
              color: Couleurs.blanc,
            ),
          ),
        ),
        onTap: () {
          // Gérer le clic sur l'élément du tableau de bord
          onPageChanged(1);
        },
      ),
      ListTile(
        leading: const Icon(
          Icons.dashboard_rounded,
          size: 18,
          color: Colors.white,
        ),
        title: Text(
          'Produits',
          style: TextStyle(
            color: Couleurs.blanc,
          ),
        ),
        onTap: () {
          // Gérer le clic sur l'élément du tableau de bord
          onPageChanged(2);
        },
      ),
      // Ajouter d'autres éléments si nécessaire
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          margin: const EdgeInsets.only(right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  // Gérer le clic sur l'image du profil
                  Popup().profilAdministrateur(context);
                },
                child: Image.asset("assets/images/blanc.png"),
              ),
            ],
          ),
        ),
      ),
      body: Row(
        children: [
          Column(
            children: [
              // Ajouter le contenu supplémentaire ici

              Expanded(
                child: Container(
                  width: 200,
                  height: MediaQuery.of(context).size.height,
                  color: Couleurs.orange,
                  child: Column(
                    children: items,
                  ),
                ),
              ),
            ],
          ),
          Expanded(child: Consumer<ArtisantService>(
            builder: (context, value, child) {
              return pages[value.indexPage];
            },
          ))
        ],
      ),
    );
  }
}
