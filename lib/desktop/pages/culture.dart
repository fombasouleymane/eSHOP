import 'package:art_eshop/desktop/controller/culture_controller.dart';
import 'package:art_eshop/desktop/model/admin_dialog.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Culture extends StatefulWidget {
  const Culture({super.key});

  @override
  State<Culture> createState() => _CultureState();
}

class _CultureState extends State<Culture> {
  @override
  Widget build(BuildContext context) {
    final cultureController = context.watch<CultureController>();
    return Scaffold(
        body: Column(children: [
      Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        color: Couleurs.blanc,
        width: MediaQuery.of(context).size.width,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Liste de Produits",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          // const SizedBox(
          //   width: 100,
          // ),
          InkWell(
            onTap: () {
              PoppupAdmin().ajoutCulture(context);
            },
            child: Container(
              height: 30,
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  color: Couleurs.orange,
                  border: Border.all(width: 1, color: Couleurs.orange),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                  child: Text(
                'Ajouter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Couleurs.blanc,
                    fontSize: 15),
              )),
            ),
          )
        ]),
      ),
      Expanded(
          child: ListView.builder(
        itemCount: 5,
        // padding: const EdgeInsets.all(10),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            highlightColor: Couleurs.orange.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              cultureController.gotoDetails();
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              padding: const EdgeInsets.all(10),
              // margin: const EdgeInsets.all(5),
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Couleurs.blanc,
                  border:
                      Border(top: BorderSide(width: 1, color: Couleurs.gri))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    // flex: 2,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: Couleurs.gri),
                          ),
                          child: Image.asset(
                            'assets/images/profil.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  const Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Culture Dogons",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("Region"),
                        Text("Date:")
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ))
    ]));
  }
}
