import 'package:get/get.dart';

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
