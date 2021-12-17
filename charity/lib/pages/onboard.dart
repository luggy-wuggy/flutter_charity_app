import 'package:charity/controller/modules/onboard/page2_controller.dart';
import 'package:charity/widgets/onboard_widgets/page1.dart';
import 'package:charity/widgets/onboard_widgets/page2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPage extends StatelessWidget {
  OnboardPage({Key? key}) : super(key: key);
  final PageController pageController = PageController(initialPage: 0);
  final Onboard2Controller page2controller = Get.put(Onboard2Controller());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        height: screenHeight,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: screenHeight * .68,
                width: screenWidth,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  children: [
                    Page1(pageController: pageController),
                    Page2(),
                  ],
                ),
              ),
              const SizedBox(height: 80),
              SmoothPageIndicator(
                controller: pageController,
                count: 2,
                effect: const WormEffect(
                  activeDotColor: Color(0xFF57b894),
                  spacing: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
