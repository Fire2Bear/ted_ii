import 'dart:convert';

import 'package:openfoodfacts/model/Product.dart';
import 'package:uuid/uuid.dart';

class Food {
  String id;
  String productName;

  Food({productName: String}) {
    this.id = Uuid().v1();
    this.productName = productName;
  }

  Food.foodWithId(this.id, this.productName);

  @override
  String toString() {
    return this.productName;
  }

  factory Food.fromProduct(Product product) {
    return Food.foodWithId(product.barcode, product.productName);
  }

  String toJson() {
    return jsonEncode({
      'id': this.id.toString(),
      'productName': this.productName.toString(),
    });
  }

  factory Food.fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return Food.foodWithId(map['id'], map['productName']);
  }

  // A function that converts a json list into a List<Food>.
  static List<Food> listFromJson(String jsonList) {
    List<dynamic> parsed = jsonDecode(jsonList);
    return parsed.map<Food>((json) => Food.fromJson(json)).toList();
  }

  // A function that converts a List<Food> into a json list.
  static String listToJson(List<Food> listFood) {
    return jsonEncode(listFood.map<String>((food) => food.toJson()).toList());
  }
}
