import 'package:charity/widgets/onboard_widgets/page1.dart';
import 'package:charity/widgets/onboard_widgets/page2.dart';
import 'package:flutter/material.dart';
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
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),
              SizedBox(
                height: MediaQuery.of(context).size.height * .68,
                width: MediaQuery.of(context).size.width,
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