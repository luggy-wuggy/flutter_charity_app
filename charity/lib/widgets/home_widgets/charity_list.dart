import 'package:charity/controller/modules/home/category_controller.dart';
import 'package:charity/controller/modules/home/charity_controller.dart';
import 'package:charity/controller/modules/home/archive/charity_scroll_controller.dart';
import 'package:charity/controller/modules/home/charity_search_controller.dart';
import 'package:charity/widgets/home_widgets/charity_search_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'charity_card.dart';

class CharityListPageView extends StatelessWidget {
  CharityListPageView({Key? key}) : super(key: key);

  final CategoryController _categoryController = Get.find<CategoryController>();
  final CharitySearchController _charitySearchController = Get.find<CharitySearchController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return !_charitySearchController.isSearch
            ? Expanded(
                child: PageView.builder(
                  controller: _categoryController.pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryController.categories.length,
                  onPageChanged: (int page) {
                    _categoryController.changeCategory(page);
                  },
                  itemBuilder: (context, index) {
                    return CharityList(index: index);
                  },
                ),
              )
            : CharitySearchList();
      },
    );
  }
}

class CharityList extends StatelessWidget {
  final CharityController _charityController = Get.find();
  final CategoryController _categoryController = Get.find();
  final int index;

  CharityList({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return _charityController.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.lightGreenAccent,
                ),
              )
            : ShaderMask(
                shaderCallback: (Rect rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.purple, Colors.purple, Colors.transparent],
                    stops: [0.0, 0.0, 0.1],
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstOut,
                child: ListView.builder(
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: _categoryController.categories[index].charityList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) {
                    var charity = _categoryController.categories[index].charityList[i];
                    return CharityCard(charity: charity);
                  },
                ),
              );
      },
    );
  }
}
