import 'package:art_eshop/desktop/controller/artisan_controller.dart';
import 'package:art_eshop/desktop/controller/culture_controller.dart';
import 'package:art_eshop/desktop/controller/operation_controller.dart';
import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ArtisanPage extends StatelessWidget {
  const ArtisanPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("ici artisan");
    return context.watch<ArtisanController>().page;
  }
}

// ::::::::::::::::::::::::::::::::cultures::::::::::::::::::;
class CulturePage extends StatelessWidget {
  const CulturePage({super.key});

  @override
  Widget build(BuildContext context) {
    print("ici culture");
    return context.watch<CultureController>().page;
  }
}

// :::::::::::::::::::::produits
class ProduitPage extends StatelessWidget {
  const ProduitPage({super.key});
  @override
  Widget build(BuildContext context) {
    return context.watch<ProduitController>().page;
  }
  
}
// ::::::::::::::::::::::::::::category
class OperationPage extends StatelessWidget {
  const OperationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return context.watch<OperationController>().page;
  }
}

// ::::::::::::::::taille

class TaillePage extends StatelessWidget {
  const TaillePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}