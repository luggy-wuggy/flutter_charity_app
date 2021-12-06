import 'package:charity/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  static String assetName = 'assets/images/world2.svg';
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final Widget svgWorld = SvgPicture.asset(
      SignUpPage.assetName,
      height: 240,
    );

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    size: 35,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                //color: Colors.green[300],
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Text(
                            'Sign Up',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 50,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Only one small step before\nyou start giving . . .',
                            style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 30,
                      child: svgWorld,
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    icon: Icon(
                      Icons.person_outline_rounded,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: emailTextController,
                  decoration: const InputDecoration(
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
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  controller: passwordTextController,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    icon: Icon(
                      Icons.lock_outlined,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () async {
                  authController.createUser(emailTextController.text, passwordTextController.text);
                },
                child: Container(
                  height: 80,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF57b894),
                    borderRadius: const BorderRadius.all(Radius.circular(3)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.green[100]!,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(-4, 4),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'SIGN UP',
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
            ),
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Log In.',
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
