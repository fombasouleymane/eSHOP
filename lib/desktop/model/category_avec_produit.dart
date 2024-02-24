// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:art_eshop/mobil/models/Categories_Entity.dart';

class CategorieWithProduit {
  Categories? category;
  int? productCount;
  CategorieWithProduit({
    this.category,
    this.productCount,
  });

  CategorieWithProduit copyWith({
    Categories? category,
    int? productCount,
  }) {
    return CategorieWithProduit(
      category: category ?? this.category,
      productCount: productCount ?? this.productCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'category': category?.toMap(),
      'productCount': productCount,
    };
  }

  factory CategorieWithProduit.fromMap(Map<String, dynamic> map) {
    return CategorieWithProduit(
      category:Categories.fromMap(map['category']),
      productCount: map['productCount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategorieWithProduit.fromJson(String source) => CategorieWithProduit.fromMap(json.decode(source));

  @override
  String toString() => 'CategorieWithProduit(category: $category, productCount: $productCount)';

  @override
  bool operator ==(covariant CategorieWithProduit other) {
    if (identical(this, other)) return true;
  
    return 
      other.category == category &&
      other.productCount == productCount;
  }

  @override
  int get hashCode => category.hashCode ^ productCount.hashCode;
}
