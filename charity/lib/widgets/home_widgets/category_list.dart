import 'package:charity/constants/styles.dart';
import 'package:charity/controller/modules/home/category_controller.dart';
import 'package:charity/controller/modules/home/archive/charity_scroll_controller.dart';
import 'package:charity/controller/modules/home/archive/rating_controller.dart';
import 'package:charity/controller/modules/home/charity_search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final CharitySearchController _charitySearchController = Get.find<CharitySearchController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return !_charitySearchController.isSearch
            ? SizedBox(
                height: 45,
                child: ListView.builder(
                  padding: const EdgeInsets.only(right: 25),
                  scrollDirection: Axis.horizontal,
                  itemCount: Get.find<CategoryController>().categories.length,
                  itemBuilder: (context, index) {
                    return CategoryOption(index: index);
                  },
                ),
              )
            : Container();
      },
    );
  }
}

class CategoryOption extends StatelessWidget {
  final int index;
  final CategoryController _categoryController = Get.find();

  CategoryOption({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            _categoryController.tapCategoryOption(index);
          },
          child: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 320),
                  style: _categoryController.selectedCategoryIndex == index ? kCategorySelected : kCategoryUnselected,
                  child: Text(
                    _categoryController.categories[index].title,
                  ),
                ),
                const SizedBox(height: 5),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInCirc,
                  height: _categoryController.selectedCategoryIndex == index ? 8 : 5,
                  width: _categoryController.selectedCategoryIndex == index ? 8 : 5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _categoryController.selectedCategoryIndex == index ? Colors.deepOrange[300] : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
