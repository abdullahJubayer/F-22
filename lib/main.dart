import 'package:flutter/material.dart';
import 'Lab03.dart';
import 'lab04/Info.dart';
import 'lab04/Lab04.dart';

void main() {
  runApp(const StartPoint());
}

class StartPoint extends StatelessWidget {
  const StartPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HospitalInfo();
  }
}
