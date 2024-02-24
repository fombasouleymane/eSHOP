import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/accueil.dart';
import 'package:art_eshop/mobil/pages/information_profil_utilisateur.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UtilisateurProfil extends StatefulWidget {
  const UtilisateurProfil({super.key});

  @override
  State<UtilisateurProfil> createState() => _UtilisateurProfilState();
}

class _UtilisateurProfilState extends State<UtilisateurProfil> {
  bool? isArtisan;
  int selectedIndex = 0;
  late Artisan artisan;

  Utilisateur utilisateur = Utilisateur();
  ArtisanSharedPreference artisanSharedPreference = ArtisanSharedPreference();

  @override
  void initState() {
    super.initState();
    artisanSharedPreference.getUserFromSharedPreference().then((value) {
      if (value != null) {
        print("--------------------objet");
        print(value);
        utilisateur = value;

        // isArtisan = true;
      } else {
        return null;
      }
      setState(() {});
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Center(
            child: Container(
              // width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 70),
              child: Text(
                "Profil",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Couleurs.blanc),
              ),
            ),
          ),
          const SizedBox(
            width: 100,
          ),
        ],
      ),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 80,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Couleurs.orange,
              borderRadius:
                  const BorderRadius.only(bottomLeft: Radius.circular(70))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Couleurs.blanc,
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Couleurs.blanc),

                  // image: const DecorationImage(
                  //     // image: AssetImage('assets/images/profil.png'),
                  //     // fit: BoxFit.cover)
                ),
                child: Center(
                  child: Text(
                    "${utilisateur.nom?.substring(0, 1)} ${utilisateur.prenom?.substring(0, 1)}",
                    style: TextStyle(
                        color: Couleurs.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "${utilisateur.nom}  ${utilisateur.prenom}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Couleurs.blanc),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const InformationProfilUtilisateur()));
                  },
                  icon: Icon(
                    FontAwesomeIcons.ellipsisVertical,
                    color: Couleurs.blanc,
                  ))
            ],
          ),
        ),
        // ::::::::::::::::::::bare de recherche
        Container(
          margin: const EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          // decoration:  BoxDecoration( border: Border),
          child: TextField(
            decoration: InputDecoration(
                prefixIconColor: Couleurs.orange,
                prefixIcon: const Icon(Icons.search),
                hintText: "Recherche",
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                contentPadding: const EdgeInsets.all(0)),
          ),
        ),

        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            "Mes Achats",
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.all(10),
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              highlightColor: Couleurs.orange.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 100,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Couleurs.blanc,
                    border: Border(
                        bottom: BorderSide(width: 1, color: Couleurs.gri))
                    // borderRadius: BorderRadius.circular(10),
                    ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 8,
                      child: Row(
                        children: [
                          Container(
                            // margin: const EdgeInsets.all(8),
                            // height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Couleurs.gri),
                              borderRadius: BorderRadius.circular(6),
                            ),

                            child: Image.asset("assets/images/plover1.png"),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: const Row(
                                    children: [
                                      Text("Nom:",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "Gran-Boubou",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    child: Row(
                                  children: [
                                    const Text("Quantite:",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                      " 5",
                                      style: TextStyle(
                                        color: Couleurs.orange,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      const Text("Prix:",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          )),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text("7500 FCFA",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Couleurs.orange)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: IconButton(
                            onPressed: () {},
                            icon: const FaIcon(
                              FontAwesomeIcons.trashCan,
                              color: Colors.red,
                            )),
                        // child: SvgPicture.asset('assets/icons/vect_droite.svg'),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ))
      ]),
    );
  }
}
