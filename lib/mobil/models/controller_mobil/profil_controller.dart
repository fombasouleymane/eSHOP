import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/pages/profil_artisan.dart';
import 'package:art_eshop/mobil/pages/profil_utilisateur.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';

class ProfilController extends StatefulWidget {
  const ProfilController({super.key});

  @override
  State<ProfilController> createState() => _ProfilControllerState();
}

class _ProfilControllerState extends State<ProfilController> {
  bool? isArtisan;
  Artisan artisan = Artisan();
  Utilisateur utilisateur = Utilisateur();
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();

  @override
  void initState() {
    super.initState();
    artisanSharedPreference
        .getArtisanFromSharedPreference()
        .then((value) async {
      if (value != null) {
        print(value);
        artisan = value;
        isArtisan = true;
      } else {
        await artisanSharedPreference
            .getUserFromSharedPreference()
            .then((value) {
          utilisateur = value!;
          isArtisan = false;
        });
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: isArtisan == null ?  Container() : isArtisan!
              ? const ArtisanProfil()
              : const UtilisateurProfil()),
    );
  }
}
