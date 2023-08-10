import 'package:floor/floor.dart';
import 'package:splash_screen/entity/product.dart';

import 'customer.dart';


@Entity(tableName: 'Order',
    foreignKeys: [ForeignKey(childColumns: ['CustomerId'], parentColumns: ['ID'], entity: Customer,onUpdate: ForeignKeyAction.cascade,onDelete: ForeignKeyAction.cascade),
    ForeignKey(childColumns: ['ProductId'], parentColumns: ['ID'], entity: Product,onUpdate: ForeignKeyAction.cascade)])
class Order {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'ID')
  final int orderId;
  @ColumnInfo(name: 'CustomerId')
  final String customerId;
  @ColumnInfo(name: 'ProductId')
  final String productId;
  @ColumnInfo(name: 'Time')
  final String time;

  Order(this.productId, this.orderId,this.customerId,this.time);
}