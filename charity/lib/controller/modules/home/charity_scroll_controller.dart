import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CharityScrollController extends GetxController {
  late final ScrollController _controller = ScrollController();
  final Rx<bool> _isTitleShowing = true.obs;

  ScrollController get controller => _controller;
  bool get isTitleShowing => _isTitleShowing.value;

  @override
  void onInit() {
    super.onInit();

    _controller.addListener(() {
      _isTitleShowing(_controller.offset < 50);
    });
  }
}
