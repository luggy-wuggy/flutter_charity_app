import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  static String assetName = 'assets/images/environment.svg';

  final Widget svgIcon = SvgPicture.asset(
    LoginPage.assetName,
    height: 210,
  );

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: screenHeight * 0.34,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        'Charity magic\nstarts\nhere',
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 1600),
                      curve: Curves.fastLinearToSlowEaseIn,
                      right: 60, //350,
                      top: 70,
                      child: svgIcon,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    icon: Icon(
                      Icons.email_outlined,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock_outlined,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 80,
                margin: const EdgeInsets.only(left: 30, right: 30),
                decoration: BoxDecoration(
                  color: const Color(0xFF57b894),
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green[100]!,
                      blurRadius: 10,
                      spreadRadius: 3,
                      offset: const Offset(-4, 8),
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'LOG IN',
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.grey[850],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed('/signup');
                },
                child: Text.rich(
                  TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Sign Up.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[850],
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
