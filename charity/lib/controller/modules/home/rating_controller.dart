import 'package:charity/models/charity_info.dart';
import 'package:get/state_manager.dart';
import 'package:flutter/material.dart';

class RatingAnimationController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationRatingController;
  late Animation<double> _ratingValue;

  @override
  void onInit() {
    _animationRatingController = AnimationController(vsync: this, duration: const Duration(milliseconds: 2250));
    super.onInit();
  }

  @override
  void onClose() {
    _animationRatingController.dispose();
    super.onClose();
  }

  AnimationController getController() => _animationRatingController;
  Animation<double> getRatingValue() => _ratingValue;

  Future<void> startAnimation(Charity charity) async {
    _ratingValue = Tween<double>(begin: 0, end: (charity.currentRating?.score)! / 100).animate(CurvedAnimation(parent: _animationRatingController, curve: Curves.easeInOutQuint))
      ..addListener(() => update());
    await _animationRatingController.forward();
  }

  void resetAnimation() => _animationRatingController.reset();
}