import 'package:art_eshop/desktop/controller/global_key_controller.dart';
import 'package:art_eshop/desktop/controller/operation_controller.dart';
import 'package:art_eshop/desktop/controller/side_bar/side_bar_page.dart';
import 'package:art_eshop/desktop/model/admin_Entity.dart';
import 'package:art_eshop/desktop/pages/ajout_admin.dart';
import 'package:art_eshop/desktop/service/admin_service.dart';
import 'package:art_eshop/key.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  // final _formkeyAdmin = GlobalKey<FormState>();
  // final formkey = GlobalKeyManager.formkeyAdminConnection;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AdminService service = AdminService();
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  bool passwordVisible = false;
  bool _isShow = false;

  @override
  Widget build(BuildContext context) {
    final globalkeyController = context.read<GlobalKeyController>();
    return Scaffold(
      body: Center(
        child: Container(
            width: 502,
            height: 360,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    color: Couleurs.gri,
                    offset: const Offset(0, 0),
                    spreadRadius: 1)
              ],
              border: Border.all(width: 1, color: Couleurs.gri),
              borderRadius: BorderRadius.circular(20),
              color: Couleurs.blanc,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Couleurs.gri),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),

                    // color: Couleurs.blanc,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "CONNEXION",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/blanc.png"),
                      ),
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 10),
                    width: 300,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Couleurs.gri),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      // color: Couleurs.blanc,
                    ),
                    // ::::::::::::::::::::::::::formulaire

                    child: Form(
                      key: globalkeyController.formkeyAdminConnection,
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                                visible: _isShow,
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    "Address email ou mot de passe incorrect",
                                    style: TextStyle(color: Colors.red),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                            // ::::::::::::::::::::::::email
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  labelText: "Email*",
                                  hintText: "Entree votre address mail",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(9.0))),
                                  contentPadding: EdgeInsets.all(8.0),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Ce champs est Obligatoir";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            // :::::::::::::::::::::::password
                            Container(
                              margin: const EdgeInsets.all(10),
                              child: TextFormField(
                                  controller: _passwordController,
                                  obscureText: passwordVisible,
                                  validator: MultiValidator([
                                    RequiredValidator(
                                        errorText: 'champ obligatoire'),
                                    MinLengthValidator(8, errorText: ''),
                                    PatternValidator(r'(?=.*?[#!@$%^&*-])',
                                        errorText:
                                            'mot de passe inferieur a 8 caracteres')
                                  ]),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  decoration: InputDecoration(
                                    hintText: 'Entre votre passe',
                                    labelText: 'Mot de passe',
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
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: TextButton(
                                      onPressed: () {},
                                      child:
                                          const Text("Mot de passe oublier")),
                                )
                              ],
                            ),

                            // ::::::::::::::::::::::::::::;;submit
                            InkWell(
                              highlightColor: Couleurs.gri,
                              borderRadius: BorderRadius.circular(10),
                              onTap: () async {
                                if (globalkeyController
                                    .formkeyAdminConnection.currentState!
                                    .validate()) {
                                  await service
                                      .verifyAdmin(_emailController.text,
                                          _passwordController.text)
                                      .then((value) {
                                    Map<String, dynamic> admin = value;
                                    if (admin["idAdmin"] != null &&
                                        admin.containsKey("idAdmin")) {
                                      // Admin adminpp = Admin.fromMap(admin);

                                      // Provider.of<OperationController>(context)
                                      //     .currentAdmin = adminpp;
                                      // print(adminpp);
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SideBarPage()));
                                    }
                                  }).catchError((onError) {
                                    setState(() {
                                      _isShow = !_isShow;
                                    });
                                  });
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                margin: const EdgeInsets.only(
                                    top: 15, left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Couleurs.orange,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "ENREGISTRER",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Couleurs.blanc),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: 10),
                            //       child: TextButton(
                            //           onPressed: () {
                            //             Navigator.push(
                            //                 context,
                            //                 MaterialPageRoute(
                            //                     builder: (context) =>
                            //                         const AjoutArtisan()));
                            //           },
                            //           child: const Text("Incrivez vous")),
                            //     )
                            //   ],
                            // ),
                          ]),
                    ))
              ],
            )),
      ),
    );
  }
}
