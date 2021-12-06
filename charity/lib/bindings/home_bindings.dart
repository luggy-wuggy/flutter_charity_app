import 'package:charity/controller/category_controller.dart';
import 'package:charity/controller/charity_controller.dart';
import 'package:charity/controller/charity_scroll_controller.dart';
import 'package:charity/controller/charity_search_controller.dart';
import 'package:charity/controller/rating_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CharityController());
    Get.put(CharitySearchController());
    Get.put(CategoryController());
    Get.put(RatingAnimationController());
    Get.put(CharityScrollController());
  }
}
