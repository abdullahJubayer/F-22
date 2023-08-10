import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:splash_screen/entity/product.dart';

class ProductTypeConverter extends TypeConverter<Product,String>{
  @override
  Product decode(String databaseValue) {
    return Product.fromJson(jsonDecode(databaseValue));
  }

  @override
  String encode(Product product) {
    return product.toJson().toString();
  }

}