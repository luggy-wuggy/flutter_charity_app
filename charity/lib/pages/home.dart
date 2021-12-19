import 'package:charity/controller/modules/home/category_controller.dart';
import 'package:charity/controller/modules/home/charity_controller.dart';
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
                _charitySearchController.isSearch ? Container() : AppTitle(),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  height: _charityScrollController.isTitleShowing ? 0 : 10,
                ),
                _charitySearchController.isSearch ? Container() : const CategoryList(),
                Expanded(
                  child: PageView.builder(
                    controller: Get.find<CategoryController>().pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: Get.find<CategoryController>().categories.length,
                    onPageChanged: (int page) {
                      Get.find<CategoryController>().changeCategory(page);
                      // Get.find<CategoryController>().setPage(page);
                    },
                    itemBuilder: (context, index) {
                      return CharityList(index: index);
                    },
                  ),
                ),

                //_charitySearchController.isSearch ? CharitySearchList() : CharityList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
