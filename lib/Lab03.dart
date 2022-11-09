import 'package:flutter/material.dart';

class Lab03 extends StatelessWidget {
  const Lab03({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("SHEREN"),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.tune),
            )
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          children: _buildGridCard(10),
        ),
      ),
    );
  }

  List<Card> _buildGridCard(int count) {
    List<Card> cards = List.generate(count, (index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.diamond_outlined),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title"),
                  SizedBox(height: 8.0),
                  Text("Description Text"),
                ],
              ),
            )
          ],
        ),
      );
    });
    return cards;
  }
}
