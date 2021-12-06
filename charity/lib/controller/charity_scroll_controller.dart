import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CharityScrollController extends GetxController {
  late ScrollController controller;
  var isTitleShowing = true.obs;

  @override
  void onInit() {
    super.onInit();
    controller = ScrollController();

    controller.addListener(() {
      isTitleShowing(controller.offset < 50);
    });
  }
}
