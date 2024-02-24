// Création d'une classe dédiée à la construction du DropdownButtonFormField
import 'package:art_eshop/mobil/models/Categories_Entity.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatelessWidget {
  final List<Categories> categories;
  final Categories? selectedCategory;
  final ValueChanged<Categories?> onChanged;
  final String? labelText;
  final String? hintText;

  const CategoryDropdown({super.key, 
    required this.categories,
    required this.selectedCategory,
    required this.onChanged,
    this.labelText,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Categories>(
      decoration: InputDecoration(
        labelText: labelText ?? 'Catégorie*',
        hintText: hintText ?? 'Choisissez une catégorie',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(9.0)),
        ),
        contentPadding: const EdgeInsets.all(8.0),
      ),
      value: selectedCategory,
      onChanged: onChanged,
      items: categories.map((Categories category) {
        return DropdownMenuItem<Categories>(
          value: category,
          child: Text(category.nom!),
        );
      }).toList(),
      validator: (value) {
        if (value == null) {
          return 'Veuillez choisir une catégorie';
        }
        return null;
      },
    );
  }
}

