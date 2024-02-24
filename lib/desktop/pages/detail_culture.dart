import 'package:art_eshop/desktop/controller/culture_controller.dart';
import 'package:art_eshop/desktop/controller/produit_controller.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DetailCultures extends StatefulWidget {
  const DetailCultures({super.key});

  @override
  State<DetailCultures> createState() => _DetailCulturesState();
}

class _DetailCulturesState extends State<DetailCultures> {
  @override
  Widget build(BuildContext context) {
    final cultureController = context.watch<CultureController>();
    return Scaffold(
      body: Column(children: [
        Center(
          child: Container(
            height: 30,
            margin: const EdgeInsets.all(10),
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Couleurs.blanc,
              border: Border.all(width: 1, color: Couleurs.orange),
            ),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search"),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          height: 490,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Couleurs.gri),
                      borderRadius: BorderRadius.circular(10)),

                  // height: 100,
                  child: Column(children: [
                    Container(
                      height: 350,
                      child: Image.asset(
                        'assets/images/plover.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(width: 1, color: Couleurs.gri))),
                      child: const Center(
                        child: Text(
                            'Redistribution. You may reproduce and distribute copies of theWork or Derivative Works thereof in any medium, with or without modifications, and in Source or Object form, provided that You meet the following conditions'),
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 1,
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300.0,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 20.0,
                  ),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return InkWell(
                        highlightColor: Couleurs.orange,
                        onTap: () {},
                        child: Container(
                          // margin: const EdgeInsets.symmetric(horizontal: 20),
                          // height: 400,
                          decoration: BoxDecoration(
                              border: Border.all(color: Couleurs.gri, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          child: Column(children: [
                            Expanded(
                              flex: 4,
                              child: Image.asset('assets/images/plover.png'),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                    padding: const EdgeInsets.all(10),
                                    width: 300,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    child: const Text("Dansse de Kora"))),
                          ]),
                        ));
                  },
                ),
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Couleurs.orange,
        elevation: 3,
        tooltip: "Retour",
        onPressed: () {
          cultureController.gotoListCulture();
        },
        child: Center(
            child: FaIcon(
          Icons.arrow_back,
          color: Couleurs.blanc,
          size: 18,
        )),
      ),
    );
  }
}
