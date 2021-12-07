import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPage extends StatelessWidget {
  OnboardPage({Key? key}) : super(key: key);
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 50),
            Container(
              height: MediaQuery.of(context).size.height * .65,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: const [
                  Page1(),
                  Page2(),
                ],
              ),
            ),
            const SizedBox(height: 80),
            SmoothPageIndicator(
              controller: pageController, // PageController
              count: 2,
              effect: const WormEffect(
                activeDotColor: Color(0xFF57b894),
              ), // your preferred effect
            )
          ],
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  static String assetName = 'assets/images/environment.svg';

  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svgIcon = SvgPicture.asset(
      Page1.assetName,
      height: 210,
    );

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .4,
          width: MediaQuery.of(context).size.width,
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
        SizedBox(height: 20),
        Text(
          'A few small steps before\nyou start giving . . .',
          style: GoogleFonts.lato(
            textStyle: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
            ),
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              color: const Color(0xFF57b894),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
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
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  static String assetWorldName = 'assets/images/world2.svg';

  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget svgWorld = SvgPicture.asset(
      Page2.assetWorldName,
      height: 240,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        svgWorld,
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
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Align(
            alignment: Alignment.center,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Zip code, or city and state",
                icon: Icon(
                  Icons.location_on_outlined,
                  size: 35,
                ),
              ),
            ),
          ),
        ),
        Spacer(),
        Align(
          alignment: Alignment.center,
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
      ],
    );
  }
}
