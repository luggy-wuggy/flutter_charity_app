import 'package:charity/constants/styles.dart';
import 'package:charity/controller/modules/home/charity_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTitle extends StatelessWidget {
  AppTitle({
    Key? key,
  }) : super(key: key);

  final CharitySearchController _charitySearchController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(
      () {
        return !_charitySearchController.isSearch
            ? Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.5,
                  margin: const EdgeInsets.only(left: 25),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Charity Watch',
                      style: kTitle,
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
