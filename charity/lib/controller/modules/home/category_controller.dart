import 'package:get/get.dart';

class CategoryController extends GetxController {
  final _categories = <String>[
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
  final _selectedCategoryIndex = 0.obs;

  int get selectedCategoryIndex => _selectedCategoryIndex.value;
  List<String> get categories => _categories;

  void selectCategory(int index) => _selectedCategoryIndex.value = index;
}
