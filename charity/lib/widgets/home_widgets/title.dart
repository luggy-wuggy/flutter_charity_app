import 'package:charity/constants/styles.dart';
import 'package:charity/controller/modules/home/charity_scroll_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTitle extends StatelessWidget {
  AppTitle({
    Key? key,
  }) : super(key: key);

  final CharityScrollController _charityScrollController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.centerLeft,
      child: Obx(
        () {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: _charityScrollController.isTitleShowing ? 1 : 0,
            child: AnimatedContainer(
              height: _charityScrollController.isTitleShowing ? screenHeight * 0.06 : 0,
              width: _charityScrollController.isTitleShowing ? screenWidth * 0.5 : 0,
              margin: const EdgeInsets.only(left: 25),
              duration: const Duration(milliseconds: 240),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  'Charity Watch',
                  style: kTitle,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
