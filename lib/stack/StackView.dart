import 'package:flutter/material.dart';

class StackView extends StatefulWidget {
  const StackView({Key? key}) : super(key: key);

  @override
  State<StackView> createState() => _StackViewState();
}

class _StackViewState extends State<StackView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Container(
                  height: 300,
                  width: 400,
                  color: Colors.green,
                  child: Center(child: Text("Top Widget")),
                ),
                Positioned(
                  top: 16,
                  left: 20,
                  child: Container(
                    width: 120,
                    height: 60,
                    color: Colors.amber,
                    child:  Center(child: Text("Top Left")),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 20,
                  child: Container(
                    width: 120,
                    height: 60,
                    color: Colors.red,
                    child: Center(child: Text("Top Right")),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
