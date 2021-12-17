import 'package:charity/controller/modules/home/charity_scroll_controller.dart';
import 'package:charity/controller/modules/home/charity_search_controller.dart';
import 'package:charity/widgets/home_widgets/category_list.dart';
import 'package:charity/widgets/home_widgets/charity_list.dart';
import 'package:charity/widgets/home_widgets/charity_search_list.dart';
import 'package:charity/widgets/home_widgets/fab.dart';
import 'package:charity/widgets/home_widgets/header.dart';
import 'package:charity/widgets/home_widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CharitySearchController _charitySearchController = Get.find<CharitySearchController>();
  final CharityScrollController _charityScrollController = Get.find<CharityScrollController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MapFAB(),
      body: Container(
        padding: const EdgeInsets.only(top: 60),
        color: Colors.white,
        child: Obx(
          () {
            return Column(
              children: [
                const HeaderWidget(),
                _charitySearchController.isSearch.value ? Container() : AppTitle(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  height: _charityScrollController.isTitleShowing.value ? 0 : 10,
                ),
                _charitySearchController.isSearch.value ? Container() : const CategoryList(),
                _charitySearchController.isSearch.value ? CharitySearchList() : CharityList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
