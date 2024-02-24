import 'dart:io';

import 'package:art_eshop/desktop/controller/artisan_controller.dart';
import 'package:art_eshop/desktop/controller/culture_controller.dart';
import 'package:art_eshop/desktop/controller/global_key_controller.dart';
import 'package:art_eshop/desktop/controller/operation_controller.dart';
import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/desktop/controller/side_bar/side_bar_controller.dart';
import 'package:art_eshop/desktop/pages/admin_connexion.dart';
import 'package:art_eshop/mobil/models/couleur.dart';

import 'package:art_eshop/mobil/pages/page_bienvenue.dart';

import 'package:art_eshop/mobil/services/artisan_service.dart';
// import 'package:art_eshop/mobil/services/image_picture.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(const MyApp());
// }

void main() {
  if (kIsWeb || defaultTargetPlatform == TargetPlatform.windows) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArtisantService(),
        ),
        ChangeNotifierProvider(
          create: (context) => GlobalKeyController(),
        )
        
      ],
      child: const MyAppDesktop(),
    ));
  } else {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProduitController(),
        
        ),
        ChangeNotifierProvider(
          create: (context) => GlobalKeyController(),
        )
      ],
      child: const MyAppMobile(),
    ));
  }
}

class MyAppMobile extends StatelessWidget {
  const MyAppMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArtiEshop Mali',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Couleurs.orange,
        ),
        fontFamily: 'Poppins',
      ),
      home: const PageBienvenue(),
    );
  }
}

class MyAppDesktop extends StatelessWidget {
  const MyAppDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SideBarController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArtisanController(),
        ),
        ChangeNotifierProvider(
          create: (context) => CultureController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProduitController(),
        ),
        ChangeNotifierProvider(
          create: (context) => OperationController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const Connexion(),
      ),
    );
  }
}
