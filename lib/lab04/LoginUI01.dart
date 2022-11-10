import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginUI01 extends StatelessWidget {
  const LoginUI01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35.0,
                ),
                SvgPicture.asset(
                  "assets/logo.svg",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text.rich(
                  TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        color: const Color(0xFF21899C),
                        letterSpacing: 3,
                        height: 1.03,
                      ),
                      children: [
                        TextSpan(children: [
                          TextSpan(
                            text: "LOGIN",
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                          TextSpan(
                            text: "PAGES",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFFE9879),
                            ),
                          ),
                        ])
                      ]),
                ),
                SizedBox(
                  height: 30.0,
                ),
                _buildEditText(obscureText: false, txt: "Email"),
                SizedBox(
                  height: 16.0,
                ),
                _buildEditText(obscureText: true, txt: 'Password'),
                SizedBox(
                  height: 16.0,
                ),
                buildRoundButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildRoundButton() {
    return Container(
                alignment: Alignment.center,
                height: 60.0,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: const Color(0xFF21899C),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF4C2E84).withOpacity(.2),
                          blurRadius: 60.0)
                    ]),
                child: Text(
                  "Login",
                  style: GoogleFonts.inter(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
  }

  Container _buildEditText({required bool obscureText, required String txt}) {
    return Container(
      alignment: Alignment.center,
      height: 60.0,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFF969AA8),
        ),
      ),
      child: TextField(
        style: GoogleFonts.inter(
          fontSize: 16.0,
          color: Color(0xFF000000),
        ),
        maxLines: 1,
        obscureText: obscureText,
        cursorColor: const Color(0xFF15224F),
        decoration: InputDecoration(
            label: Text(txt),
            labelStyle: GoogleFonts.inter(
              fontSize: 12.0,
              color: Color(0xFF969AA8),
            ),
            border: InputBorder.none),
      ),
    );
  }
}
