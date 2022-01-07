import 'package:charity/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Page1 extends StatelessWidget {
  final PageController pageController;
  final Widget svgIcon = SvgPicture.asset(
    ImageStrings.givingSVG,
    height: 210,
  );

  Page1({Key? key, required this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: screenHeight * .4,
          width: screenWidth,
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
                top: 120,
                child: svgIcon,
              ),
            ],
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'A few small steps before\nyou start giving . . .',
          style: GoogleFonts.lato(
            textStyle:const TextStyle(
              color: Color(0xFF616161),
              fontSize: 18,
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 1200),
                curve: Curves.easeInOutCubicEmphasized,
              );
            },
            child: Container(
              height: 60,
              width: screenWidth * 0.45,
              decoration: const BoxDecoration(
                color: Color(0xFF57b894),
                borderRadius:  BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                    color:  Color(0xFFC8E6C9),
                    blurRadius: 10,
                    spreadRadius: 3,
                    offset: Offset(-4, 8),
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'Start',
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
