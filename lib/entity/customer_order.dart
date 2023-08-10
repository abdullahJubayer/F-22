import 'package:floor/floor.dart';

// @DatabaseView(
//     'SELECT '
//         'Order.ID AS orderId,'
//         'Order.Time AS orderTime,'
//         'Customer.Name AS customerName,'
//         'Customer.Address AS customerAddress,'
//         'Product.Name AS productName,'
//         'Product.Price AS productPrice '
//         'FROM Order INNER JOIN Customer ON Order.CustomerId=Customer.ID INNER JOIN Product ON Order.ProductId=Product.ID',
//     viewName: 'CustomerOrder')
class CustomerOrder {

  final String orderId;
  final String orderTime;

  final String customerName;
  final String customerAddress;

  final String productName;
  final String productPrice;

  CustomerOrder(this.orderId, this.orderTime,this.customerName,this.customerAddress,this.productName,this.productPrice);
}