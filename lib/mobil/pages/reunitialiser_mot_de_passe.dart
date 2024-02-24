import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class Reunitialisation extends StatefulWidget {
  const Reunitialisation({super.key});

  @override
  State<Reunitialisation> createState() => _ReunitialisationState();
}

class _ReunitialisationState extends State<Reunitialisation> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNodeDummy = FocusNode();

  void handleTextChange(String value, TextEditingController currentController,
      FocusNode currentFocus, FocusNode previousFocus, FocusNode nextFocus) {
    if (value.isEmpty) {
      previousFocus.requestFocus();
      currentController.clear();
    } else if (value.length == 1) {
      currentFocus.unfocus();
      // ignore: unnecessary_null_comparison
      if (nextFocus != null) {
        nextFocus.requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Couleurs.blanc,
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: SvgPicture.asset("assets/icons/cardenat_ouvert.svg"),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Center(
                  child: Text(
                    "Réinitialisation du mot de passe",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 10, bottom: 1),
                child: Text(
                  "Veillez saisir  le code que Nous avons envoyer a  adresse mail ",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Text(
                "ousmatotoure98@gmail.com ",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 70,
                      child: TextFormField(
                        controller: controller1,
                        focusNode: focusNode1,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (controller1.text.isEmpty && value.isEmpty) {
                            // Ne rien faire si le champ 1 est vide et l'utilisateur efface
                          } else {
                            handleTextChange(value, controller1, focusNode1,
                                focusNodeDummy, focusNode2);
                          }
                        },
                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   width: 20,
                    // ),
                    Container(
                      width: 40,
                      height: 70,
                      child: TextFormField(
                        controller: controller2,
                        focusNode: focusNode2,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (controller2.text.isEmpty && value.isEmpty) {
                            handleTextChange(value, controller2, focusNode2,
                                focusNode1, focusNode3);
                          } else {
                            handleTextChange(value, controller2, focusNode2,
                                focusNode1, focusNode3);
                          }
                        },
                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 70,
                      child: TextFormField(
                        controller: controller3,
                        focusNode: focusNode3,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (controller3.text.isEmpty && value.isEmpty) {
                            handleTextChange(value, controller3, focusNode3,
                                focusNode2, focusNode4);
                          } else {
                            handleTextChange(value, controller3, focusNode3,
                                focusNode2, focusNode4);
                          }
                        },

                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 70,
                      child: TextFormField(
                        controller: controller4,
                        focusNode: focusNode4,
                        maxLength: 1,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (value) {
                          if (controller4.text.isEmpty && value.isEmpty) {
                            handleTextChange(value, controller4, focusNode4,
                                focusNode3, focusNodeDummy);
                          } else {
                            handleTextChange(value, controller4, focusNode4,
                                focusNode3, focusNodeDummy);
                          }
                        },

                        style: const TextStyle(
                            fontSize: 28,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        // controller: _emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0))),
                          contentPadding: EdgeInsets.all(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              // :::::::::::::::submit:::::::::::::::
              InkWell(
                highlightColor: Couleurs.gri,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  // margin:
                  //     const EdgeInsets.only(top: 15, left: 40, right: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Couleurs.orange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Réinitialiser",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Couleurs.blanc),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                highlightColor: Couleurs.gri,
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  margin: const EdgeInsets.only(left: 35, right: 35),
                  // margin:
                  //     const EdgeInsets.only(top: 15, left: 40, right: 40),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Couleurs.orange,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Reenvoyer",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Couleurs.blanc),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/retour.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    "Retourner vers",
                    style: TextStyle(fontSize: 18),
                  ),
                  TextButton(
                      onPressed: (() {}),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Couleurs.orange, fontSize: 18),
                      )),
                ],
              ),

              const SizedBox(
                height: 40,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 5,
                    width: 80,
                    color: Couleurs.gri,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    height: 5,
                    width: 80,
                    color: Couleurs.orange,
                  ),
                  Container(
                    height: 5,
                    width: 80,
                    color: Couleurs.gri,
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
