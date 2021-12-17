import 'package:charity/controller/modules/home/category_controller.dart';
import 'package:charity/controller/modules/home/charity_controller.dart';
import 'package:charity/controller/modules/home/charity_scroll_controller.dart';
import 'package:charity/controller/modules/home/charity_search_controller.dart';
import 'package:charity/controller/modules/home/rating_controller.dart';
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
