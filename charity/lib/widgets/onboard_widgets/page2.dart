import 'package:charity/constants/image_strings.dart';
import 'package:charity/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatefulWidget {
  static String assetWorldName = 'assets/images/world2.svg';

  Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  AuthController authController = Get.find<AuthController>();

  late FocusNode myFocusNode = FocusNode();
  TextEditingController locationTextController = TextEditingController();

  final Widget svgWorld = SvgPicture.asset(
    ImageStrings.worldSVG,
    height: 240,
  );

  bool textFieldTapped = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (!textFieldTapped) svgWorld,
        const SizedBox(
          height: 40,
        ),
        Text(
          'Where do you live?',
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Align(
            alignment: Alignment.center,
            child: TextField(
              onTap: () {
                setState(() {
                  textFieldTapped = true;
                });
              },
              onSubmitted: (String s) {
                setState(() {
                  textFieldTapped = false;
                });
              },
              focusNode: myFocusNode,
              controller: locationTextController,
              decoration: const InputDecoration(
                hintText: "Zip code, or city and state",
                icon: Icon(
                  Icons.location_on_outlined,
                  size: 35,
                ),
              ),
            ),
          ),
        ),
        if (textFieldTapped)
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30),
            height: MediaQuery.of(context).size.height * 0.3,
            //color: Colors.green,
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                ListTile(
                  title: Text('SEARCH'),
                ),
                ListTile(
                  title: Text('SEARCH'),
                ),
                ListTile(
                  title: Text('SEARCH'),
                ),
                ListTile(
                  title: Text('SEARCH'),
                ),
              ],
            ),
          ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              authController.createUser(locationTextController.text);
            },
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width * 0.45,
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
                'Submit',
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
        const SizedBox(height: 20),
      ],
    );
  }
}
