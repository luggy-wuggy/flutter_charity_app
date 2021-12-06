import 'package:charity/controller/rating_controller.dart';
import 'package:get/get.dart';
import 'package:charity/models/charity_info.dart';
import 'package:charity/services/charity_watch_api.dart';

import 'charity_controller.dart';

class CategoryController extends GetxController {
  final categories = <String>[
    "For you",
    "Animals",
    "Art & Culture",
    "Civil Rights",
    "Community",
    "Education",
    "Health",
    "Human Services",
    "International",
    "Religion",
    "Research",
  ].obs;

  var selectedCategoryIndex = 0.obs;

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
  }
}
