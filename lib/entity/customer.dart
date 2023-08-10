import 'package:floor/floor.dart';
import 'package:splash_screen/entity/product.dart';


@Entity(tableName: 'Customer',indices: [Index(value: ['Name'])])
class Customer {
  @PrimaryKey(autoGenerate: true)
  @ColumnInfo(name: 'ID')
  final int customerId;
  @ColumnInfo(name: 'Name')
  final String customerName;
  @ColumnInfo(name: 'Age')
  final int customerAge;
  @ColumnInfo(name: 'Address')
  final String customerAddress;
  @ColumnInfo(name: 'Product')
  final Product product;

  @ColumnInfo(name: 'Dummy')
  final int dummy;

  Customer(this.customerId, this.customerName,this.customerAge,this.customerAddress,this.product,this.dummy);
}