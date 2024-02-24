// import 'package:fluent_ui/fluent_ui.dart';
import 'package:art_eshop/mobil/models/couleur.dart';
import 'package:flutter/material.dart';

class Popup {
  final TextEditingController _emailController2 = TextEditingController();
  final TextEditingController _emailController3 = TextEditingController();
  // ServiceLoger service = ServiceLoger();
  final _formkey = GlobalKey<FormState>();

  void dialogAjoutAdmin(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: AlertDialog(
                      // title:
                      content: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 600,
                            // width: 400,
                            color: Couleurs.gri,
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            height: 600,
                            // width: 400,
                            color: Couleurs.orange,
                          ))
                    ],
                  ))));
        });
  }
}
