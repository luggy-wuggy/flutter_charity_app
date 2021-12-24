import 'package:charity/controller/modules/home/charity_controller.dart';
import 'package:charity/models/charity_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final _categories = <CharityCategory>[
    CharityCategory(title: 'For you'),
    CharityCategory(title: 'Animals'),
    CharityCategory(title: 'Art & Culture'),
    CharityCategory(title: 'Education'),
    CharityCategory(title: 'Environment'),
    CharityCategory(title: 'Health'),
    CharityCategory(title: 'Human Services'),
    CharityCategory(title: 'International'),
    CharityCategory(title: 'Human Civil Rights'),
    CharityCategory(title: 'Religion'),
    CharityCategory(title: 'Community Development'),
    CharityCategory(title: 'Research'),
  ].obs;
  final _selectedCategoryIndex = 0.obs;

  final PageController _pageController = PageController(initialPage: 0);

  int get selectedCategoryIndex => _selectedCategoryIndex.value;
  List<CharityCategory> get categories => _categories;
  PageController get pageController => _pageController;

  void changeCategory(int index) async {
    _selectedCategoryIndex.value = index;

    if (_categories[index].charityList.isEmpty) {
      _categories[index].charityList = await Get.find<CharityController>().fetchCharitiesByCategory(index);
    }
  }

  void tapCategoryOption(int index) async {
    if (_selectedCategoryIndex.value + 1 == index || _selectedCategoryIndex.value - 1 == index) {
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 1200),
        curve: Curves.easeInOutCubicEmphasized,
      );
    } else {
      _pageController.jumpToPage(index);
    }
  }
}
