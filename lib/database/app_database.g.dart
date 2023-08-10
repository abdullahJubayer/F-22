// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  Dao? _daoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 3,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Customer` (`ID` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `Name` TEXT NOT NULL, `Age` INTEGER NOT NULL, `Address` TEXT NOT NULL, `Product` TEXT NOT NULL, `Dummy` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Order` (`ID` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `CustomerId` TEXT NOT NULL, `ProductId` TEXT NOT NULL, `Time` TEXT NOT NULL, FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`ID`) ON UPDATE CASCADE ON DELETE CASCADE, FOREIGN KEY (`ProductId`) REFERENCES `Product` (`ID`) ON UPDATE CASCADE ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Product` (`ID` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `Name` TEXT NOT NULL, `Quantity` TEXT NOT NULL, `Price` TEXT NOT NULL)');
        await database.execute(
            'CREATE INDEX `index_Customer_Name` ON `Customer` (`Name`)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  Dao get dao {
    return _daoInstance ??= _$Dao(database, changeListener);
  }
}

class _$Dao extends Dao {
  _$Dao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _customerInsertionAdapter = InsertionAdapter(
            database,
            'Customer',
            (Customer item) => <String, Object?>{
                  'ID': item.customerId,
                  'Name': item.customerName,
                  'Age': item.customerAge,
                  'Address': item.customerAddress,
                  'Product': _productTypeConverter.encode(item.product),
                  'Dummy': item.dummy
                },
            changeListener),
        _productInsertionAdapter = InsertionAdapter(
            database,
            'Product',
            (Product item) => <String, Object?>{
                  'ID': item.productId,
                  'Name': item.productName,
                  'Quantity': item.productQuantity,
                  'Price': item.productPrice
                },
            changeListener),
        _customerUpdateAdapter = UpdateAdapter(
            database,
            'Customer',
            ['ID'],
            (Customer item) => <String, Object?>{
                  'ID': item.customerId,
                  'Name': item.customerName,
                  'Age': item.customerAge,
                  'Address': item.customerAddress,
                  'Product': _productTypeConverter.encode(item.product),
                  'Dummy': item.dummy
                },
            changeListener),
        _customerDeletionAdapter = DeletionAdapter(
            database,
            'Customer',
            ['ID'],
            (Customer item) => <String, Object?>{
                  'ID': item.customerId,
                  'Name': item.customerName,
                  'Age': item.customerAge,
                  'Address': item.customerAddress,
                  'Product': _productTypeConverter.encode(item.product),
                  'Dummy': item.dummy
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Customer> _customerInsertionAdapter;

  final InsertionAdapter<Product> _productInsertionAdapter;

  final UpdateAdapter<Customer> _customerUpdateAdapter;

  final DeletionAdapter<Customer> _customerDeletionAdapter;

  @override
  Stream<List<Customer>> getAllCustomer() {
    return _queryAdapter.queryListStream('SELECT * FROM Customer',
        mapper: (Map<String, Object?> row) => Customer(
            row['ID'] as int,
            row['Name'] as String,
            row['Age'] as int,
            row['Address'] as String,
            _productTypeConverter.decode(row['Product'] as String),
            row['Dummy'] as int),
        queryableName: 'Customer',
        isView: false);
  }

  @override
  Stream<List<Product>> getAllProduct() {
    return _queryAdapter.queryListStream('SELECT * FROM Product',
        mapper: (Map<String, Object?> row) => Product(
            productId: row['ID'] as int,
            productName: row['Name'] as String,
            productQuantity: row['Quantity'] as String,
            productPrice: row['Price'] as String),
        queryableName: 'Product',
        isView: false);
  }

  @override
  Future<void> insertAllCustomer(List<Customer> profile) async {
    await _customerInsertionAdapter.insertList(
        profile, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertAllProduct(List<Product> profile) async {
    await _productInsertionAdapter.insertList(
        profile, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateCustomer(Customer profile) async {
    await _customerUpdateAdapter.update(profile, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteCustomer(Customer profile) async {
    await _customerDeletionAdapter.delete(profile);
  }
}

// ignore_for_file: unused_element
final _productTypeConverter = ProductTypeConverter();
