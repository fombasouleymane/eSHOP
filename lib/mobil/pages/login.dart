// ignore_for_file: library_private_types_in_public_api, unused_element, camel_case_types

import 'dart:convert';

import 'package:art_eshop/desktop/controller/global_key_controller.dart';
import 'package:art_eshop/mobil/models/Artisan_Entity.dart';
import 'package:art_eshop/mobil/models/Utilisateur_Entity.dart';
import 'package:art_eshop/mobil/models/controller_mobil/bottom_navigation_bar.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:art_eshop/mobil/models/dalog.dart';
import 'package:art_eshop/mobil/models/spinner_page.dart';
import 'package:art_eshop/mobil/pages/accueil.dart';
import 'package:art_eshop/mobil/pages/artisan_inscription.dart';
import 'package:art_eshop/mobil/pages/information_profil_artisan.dart';
import 'package:art_eshop/mobil/pages/information_profil_utilisateur.dart';
import 'package:art_eshop/mobil/pages/inscription.dart';
import 'package:art_eshop/mobil/pages/mot_de_pass_oublier.dart';
import 'package:art_eshop/mobil/services/artisan_service.dart';
import 'package:art_eshop/mobil/services/sharedPreference/artisan_sharedPreference.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key, required this.artisantype}) : super(key: key);
  final bool artisantype;
  @override
  _loginState createState() => _loginState();
}

//  final credential = GoogleAuthProvider.credential(idToken: idToken);
// final _formkeyLogin = GlobalKey<FormState>();

class _loginState extends State<login> {
  final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _emailController2 = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  // ServiceLoger service = ServiceLoger();
  Popup popups = Popup();
  ArtisantService serviceartisan = ArtisantService();
  Artisan artisanClass = Artisan();
  bool isShow = false;
  Utilisateur utilisateurClass = Utilisateur();
  ArtisanSharedPreference serviceShaders = ArtisanSharedPreference();
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    intializeFirebase();
  }

  Future<void> intializeFirebase() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        debugPrint('User is currently signed out!');
      } else {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => ),
        // );
        debugPrint('User is signed in!');
      }
    });
  }

  // bool _isTextFieldEmpty = false;
  bool passwordVisible = false;
  // Color maCouleur = const Color(0xFFFD7E2E);

  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();

    return Scaffold(
      // resizeToAvoidBottomInset: true,

      appBar: AppBar(
        elevation: 0,
        leading: Container(),
        toolbarHeight: 20,
        backgroundColor: Couleurs.orange,
      ),
      // ::::::::::::::::::::::le body :::::::::::::::::::::::::::::::::::::
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 190,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Couleurs.orange,
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(70))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Image.asset('assets/images/blanc.png')),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    // ::::::::formulaire::::::::::::::
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Form(
                        key: globalkeyController.formkeyLogin,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Visibility(
                                visible: isShow,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "Address email ou mot de passe incorrect",
                                    style: TextStyle(color: Colors.red),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextFormField(
                                  controller: _emailController,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Enter email address'),
                                    EmailValidator(
                                        errorText:
                                            'Please correct email filled'),
                                  ]),
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    labelText: 'Email',
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      //color: Colors.green,
                                    ),
                                    errorStyle: const TextStyle(fontSize: 18.0),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.0))),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Couleurs.orange,
                                      ), // Bordure lorsque le champ est en focus
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                  )),
                            ),

                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: TextFormField(
                                  controller: _passController,
                                  obscureText: passwordVisible,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'Please enter Password'),
                                    MinLengthValidator(8,
                                        errorText:
                                            'Password must be atlist 8 digit'),
                                    PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                        errorText:
                                            'Password must be atlist one special character')
                                  ]),
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    suffixIcon: IconButton(
                                      icon: Icon(passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      onPressed: () {
                                        setState(
                                          () {
                                            passwordVisible = !passwordVisible;
                                          },
                                        );
                                      }, //color: Colors.green,
                                    ),
                                    errorStyle: const TextStyle(fontSize: 18.0),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(9.0))),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Couleurs.orange,
                                      ), // Bordure lorsque le champ est en focus
                                      borderRadius: BorderRadius.circular(9.0),
                                    ),
                                  )),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // ::::::::::::::::::::::::::
                                TextButton(
                                  child: Text(
                                    "Mot de passe oublié",
                                    style: TextStyle(
                                        color: Couleurs.orange,
                                        fontFamily: "Dubai",
                                        fontSize: 14),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const MotDePasseOublier()));
                                    // popups.dialog(context);
                                  },
                                )
                              ],
                            ),
                            Container(
                                decoration: const BoxDecoration(),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (globalkeyController
                                        .formkeyLogin.currentState!
                                        .validate()) {
                                      String email = _emailController.text;
                                      String password = _passController.text;
                                      await serviceartisan
                                          .verifieConnexion(email, password)
                                          .then((value) {
                                        Map<String, dynamic> map =
                                            value as Map<String, dynamic>;
                                        if (map['entreprise'] != null) {
                                          print("----------------------${map}");
                                          serviceShaders
                                              .addArtisanToSharedPreference(
                                                  Artisan.fromMap(map))
                                              .then((value) {
                                            print("je suis artisabn");
                                            print(Artisan.fromMap(map));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BottomNavigationExample()));
                                            print("i'm artisant");
                                          });
                                        } else {
                                          print(value);
                                          serviceShaders
                                              .addUtilisateurToSharedPreference(
                                                  Utilisateur.fromMap(map))
                                              .then((value) {
                                            print(
                                                "---------------------------interierur");
                                            print(Utilisateur.fromMap(map));
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const BottomNavigationExample()));

                                            print("i'm user");
                                          });
                                        }
                                        print(
                                            'je suis type${value.runtimeType}');
                                      }).catchError((onError) {
                                        print(onError);
                                        setState(() {
                                          isShow = !isShow;
                                        });
                                      });
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Couleurs.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 120, vertical: 10)),
                                  child: const Text(
                                    'CONNEXION',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 18),
                                  ),
                                )),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Pas de compte ?',
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: 'Dubai'),
                                ),
                                TextButton(
                                  child: Text(
                                    "En créer",
                                    style: TextStyle(
                                        color: Couleurs.orange,
                                        fontFamily: "Poppins",
                                        fontSize: 14),
                                  ),
                                  onPressed: () async {
                                    if (widget.artisantype) {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ArtisanInscription()),
                                      );
                                    } else {
                                      await Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Inscription()),
                                      );
                                    }

                                    // Get.to(ForgetPassword());
                                  },
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        //  color: Color.fromARGB(255, 255, 255, 255),
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    // height: 10,
                                    // width: 100,
                                  ),
                                ),
                                const Expanded(
                                    flex: 1,
                                    child: Text(
                                      "ou",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 25),
                                    )),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: BoxDecoration(
                                        //  color: Color.fromARGB(255, 255, 255, 255),
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Couleurs.gri))),
                                    // height: 10,
                                    // width: 100,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Connecter vous avec votre compte",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 15),
                            InkWell(
                              onTap: () {
                                // signInWithGoogle();
                              },
                              child: Container(
                                height: 50,
                                width: 250,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Couleurs.gri),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                          "assets/images/google_icon.png"),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text(
                                        "Google",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                              ),
                            )
                            // TextFormField(),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // resizeToAvoidBottomInset: false,
    );
  }
}
