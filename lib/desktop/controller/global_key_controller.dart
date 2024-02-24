import 'package:flutter/material.dart';

class GlobalKeyController extends ChangeNotifier {
  final formkeyProduit = GlobalKey<FormState>();
  final formkeyLogin = GlobalKey<FormState>();
  final formkeyInscription = GlobalKey<FormState>();
  final formkeyAdmin = GlobalKey<FormState>();
  final formkeyAjoutAdmin = GlobalKey<FormState>();
  final formkeyArtisan = GlobalKey<FormState>();
  final keyProfilArtisan = GlobalKey<FormState>();
  final formkeyInformationUser = GlobalKey<FormState>();
  final formkeyAdminConnection = GlobalKey<FormState>();
  final formkeyCategory = GlobalKey<FormState>();
  final formkeyConfirmeCodeAdmin = GlobalKey<FormState>();
  final formkeyTaille = GlobalKey<FormState>();
  final formKeyCulture = GlobalKey<FormState>();

}
