import 'package:charity/constants/image_strings.dart';
import 'package:charity/controller/modules/authentication/auth_controller.dart';
import 'package:charity/controller/modules/onboard/page2_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Page2 extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final Onboard2Controller page2controller = Get.find<Onboard2Controller>();

  final Widget svgWorld = SvgPicture.asset(
    ImageStrings.worldSVG,
  );

  Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Duration animationSpeed = 370.milliseconds;
    Curve animationCurves = Curves.easeInOutQuart;

    return Obx(
      () {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedOpacity(
              duration: animationSpeed,
              curve: animationCurves,
              opacity: page2controller.textFieldTapped ? 0 : 1,
              child: AnimatedContainer(
                duration: animationSpeed,
                curve: animationCurves,
                height: page2controller.textFieldTapped ? 0 : 240,
                width: page2controller.textFieldTapped ? 0 : 240,
                alignment: Alignment.topCenter,
                child: svgWorld,
              ),
            ),
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
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Align(
                alignment: Alignment.center,
                child: TextField(
                  onTap: () {
                    page2controller.toggleIsTextFieldTapped(true);
                  },
                  onSubmitted: (String s) {
                    page2controller.toggleIsTextFieldTapped(false);
                  },
                  controller: page2controller.textController,
                  focusNode: page2controller.focusNode,
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
            AnimatedContainer(
              duration: animationSpeed,
              curve: animationCurves,
              padding: const EdgeInsets.only(left: 30, right: 30),
              height: page2controller.textFieldTapped ? MediaQuery.of(context).size.height * 0.3 : 0,
              child: ListView.builder(
                itemCount: page2controller.suggestions.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  var suggestion = page2controller.suggestions[index];

                  return ListTile(
                    title: Text(suggestion.description),
                    onTap: () {
                      page2controller.setSuggestion(suggestion.description, suggestion.placeId);
                    },
                  );
                },
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  authController.createUser(page2controller.textController.text);
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
      },
    );
  }
}
