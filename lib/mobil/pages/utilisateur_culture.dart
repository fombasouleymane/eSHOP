import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/pages/utilisateur_culture_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UtilisateurCulture extends StatefulWidget {
  const UtilisateurCulture({super.key});

  @override
  State<UtilisateurCulture> createState() => _UtilisateurCultureState();
}

class _UtilisateurCultureState extends State<UtilisateurCulture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Couleurs.blanc,
      appBar: AppBar(
          elevation: 0,
          title: Text(
            "Cultures Maliennes",
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Couleurs.blanc),
          )),
      body: Container(
        child: Column(children: [
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
          Expanded(
              child: ListView.builder(
            itemCount: 5,
            padding: const EdgeInsets.all(10),
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                highlightColor: Couleurs.orange.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const UtilisateurCultureDetail()));
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(5),
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Couleurs.blanc,
                      border:
                          Border(top: BorderSide(width: 1, color: Couleurs.gri))
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
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Couleurs.gri),
                                // borderRadius: BorderRadius.circular(6),
                              ),

                              child: Image.asset("assets/images/plover.png"),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Text(
                              "Culture Dogon",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          child:
                              SvgPicture.asset('assets/icons/vect_droite.svg'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ))
        ]),
      ),
    );
  }
}
