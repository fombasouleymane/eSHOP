// Création d'une classe dédiée à la construction du DropdownButtonFormField
// import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:art_eshop/mobil/models/Taille_Entity.dart';
import 'package:flutter/material.dart';
// import 'package:art_eshop/mobil/services/artisan_service.dart';
// import 'package:art_eshop/mobil/services/taille_service.dart';
// import 'package:flutter/material.dart';

// import 'package:multi_dropdown/enum/app_enums.dart';
// import 'package:multi_dropdown/models/chip_config.dart';
// import 'package:multi_dropdown/models/network_config.dart';
// import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_dropdown/widgets/hint_text.dart';
import 'package:multi_dropdown/widgets/selection_chip.dart';
import 'package:multi_dropdown/widgets/single_selected_item.dart';

class TailleDropdown extends StatelessWidget {
  final List<TailleProduit> tailles;
   String? labelText;
   String? hintText;

   TailleDropdown({
    Key? key,
   required this.tailles,
    this.labelText,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText ?? 'Taille*',
          hintText: hintText ?? 'Choisissez une Taille',
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(9.0)),
          ),
          contentPadding: const EdgeInsets.all(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: tailles.map((TailleProduit tailleProduit) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                tailleProduit.libelle ?? '',
                style: TextStyle(fontSize: 16.0),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

