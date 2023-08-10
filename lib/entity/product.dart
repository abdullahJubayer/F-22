import 'package:floor/floor.dart';


@Entity(tableName: 'Product')
class Product {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'ID')
  final int productId;
  @ColumnInfo(name: 'Name')
  final String productName;
  @ColumnInfo(name: 'Quantity')
  final String productQuantity;
  @ColumnInfo(name: 'Price')
  final String productPrice;

  Product({required this.productId, required this.productName, required this.productQuantity,required this.productPrice});

  Map<String, dynamic> toJson() {
    return {
      "productId": this.productId,
      "productName": this.productName,
      "productQuantity": this.productQuantity,
      "productPrice": this.productPrice,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: int.parse(json["productId"]),
      productName: json["productName"],
      productQuantity: json["productQuantity"],
      productPrice: json["productPrice"],
    );
  }
//
}