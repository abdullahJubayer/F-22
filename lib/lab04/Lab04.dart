import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_22/lab04/LoginUI01.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Lab04 extends StatelessWidget {
  const Lab04({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginUI01()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/logo.svg",
              width: 160,
              height: 160,
            ),
            SizedBox(
              height: 16.0,
            ),
            Text.rich(
              TextSpan(
                style: GoogleFonts.inter(
                  fontSize: 30,
                  color: const Color(0xFF21899C),
                  letterSpacing: 3,
                  height: 1.03,
                ),
                children: [
                  TextSpan(
                    text: "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(
                    text: "PAGES\nUI",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFFE9879),
                    ),
                  ),
                  TextSpan(
                    text: " KIT",
                    style: TextStyle(fontWeight: FontWeight.w800),
                  )
                ],
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
