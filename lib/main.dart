import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:splash_screen/entity/customer.dart';
import 'package:splash_screen/entity/product.dart';
import 'package:splash_screen/widget/product_card_view.dart';

import 'database/app_database.dart';
import 'database/dao.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').addMigrations([migration2To3]).build();
  runApp(MyApp(
    database: database,
  ));
}

class MyApp extends StatelessWidget {
  final AppDatabase database;

  const MyApp({required this.database});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', dao: database.dao),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.dao});

  final String title;
  final Dao dao;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: widget.dao.getAllProduct(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: snapshot.requireData.length,
                itemBuilder: (context, index) {
                  return ProductCardView(
                    product: snapshot.requireData[index],
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          insertData();
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void insertData() async {
    final res = await widget.dao.insertAllCustomer(getCustomerList());
    final result = await widget.dao.insertAllProduct(getProductList());
  }

  List<Customer> getCustomerList() {
    return [
      Customer(1, 'Afridi Mahfuz', 32, 'Uttara',Product(productId: 1, productName: 'Shirt',   productPrice: '50', productQuantity: '200'),0),
      Customer(2, 'Toufiq ul Islam', 30, 'Badda',Product(productId: 1, productName: 'Shirt',   productPrice: '50', productQuantity: '200'),0),
      Customer(3, 'Sheble Redwan', 28, 'Baridhara',Product(productId: 1, productName: 'Shirt',   productPrice: '50', productQuantity: '200'),0),
      Customer(4, 'Sazzad Hossain', 28, 'Kolabagan',Product(productId: 1, productName: 'Shirt',   productPrice: '50', productQuantity: '200'),0)
    ];
  }

  List<Product> getProductList() {
    return [
      Product(productId: 1, productName: 'Shirt',   productPrice: '50', productQuantity: '200'),
      Product(productId: 2, productName: 'Pant',    productPrice: '50', productQuantity: '400'),
      Product(productId: 3, productName: 'Panjabi', productPrice:'50',  productQuantity: '100'),
      Product(productId:4, productName:  'T-Shirt', productPrice:'50', productQuantity:  '150')
    ];
  }
}
