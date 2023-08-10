import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import '../entity/customer.dart';
import '../entity/customer_order.dart';
import '../entity/order.dart';
import '../entity/product.dart';
import '../entity/product_type_converter.dart';
import 'dao.dart';

part 'app_database.g.dart'; // the generated code will be there


@TypeConverters([ProductTypeConverter])
@Database(version: 3, entities: [Customer,Order,Product])
abstract class AppDatabase extends FloorDatabase {
  Dao get dao;
}

final migration2To3 = Migration(2, 3, (database) async {
  await database.execute('ALTER TABLE Customer ADD COLUMN Dummy INTEGER');
},);