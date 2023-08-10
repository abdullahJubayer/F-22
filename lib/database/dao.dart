import 'package:floor/floor.dart';
import 'package:splash_screen/entity/product.dart';

import '../entity/customer.dart';




@dao
abstract class Dao{

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllCustomer(List<Customer> profile);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateCustomer(Customer profile);

  @delete
  Future<void> deleteCustomer(Customer profile);

  @Query('SELECT * FROM Customer')
  Stream<List<Customer>> getAllCustomer();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertAllProduct(List<Product> profile);

  @Query('SELECT * FROM Product')
  Stream<List<Product>> getAllProduct();


}
