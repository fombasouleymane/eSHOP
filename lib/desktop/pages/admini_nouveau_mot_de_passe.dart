import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdminNouveauMotDePasse extends StatefulWidget {
  const AdminNouveauMotDePasse({super.key});

  @override
  State<AdminNouveauMotDePasse> createState() => _AdminNouveauMotDePasseState();
}

class _AdminNouveauMotDePasseState extends State<AdminNouveauMotDePasse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Couleurs.blanc,
      ),
      body: Center(
        child: Container(
          width: 380,
          height: 700,
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Couleurs.gri),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Form(
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SvgPicture.asset("assets/icons/cardinafermer.svg"),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Nouveau mot de passe",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Veillez saisir un mot de passe nouveau de 8 caractere",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    // margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      // controller: _emailController,
                      decoration: const InputDecoration(
                        // labelText: "E-mail *",
                        hintText: "Entree un nouveau mot de passe",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0))),
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ce champs est Obligatoir";
                        }
                        return null;
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    // margin: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      // controller: _emailController,
                      decoration: const InputDecoration(
                        // labelText: " *",
                        hintText: "Confirmer votre mot de passe",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(9.0))),
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Ce champs est Obligatoir";
                        }
                        return null;
                      },
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
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      // margin:
                      //     const EdgeInsets.only(top: 15, left: 40, right: 40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Couleurs.orange,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Envoyer",
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
                    height: 40,
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
                            style:
                                TextStyle(color: Couleurs.orange, fontSize: 18),
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
                        color: Couleurs.orange,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        height: 5,
                        width: 80,
                        color: Couleurs.gri,
                      ),
                      Container(
                        height: 5,
                        width: 80,
                        color: Couleurs.gri,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
