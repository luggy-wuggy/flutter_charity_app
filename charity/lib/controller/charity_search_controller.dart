import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:charity/models/charity_info.dart';
import 'package:charity/services/charity_watch_api.dart';

class CharitySearchController extends GetxController {
  var isLoading = false.obs;
  var charityList = <Charity>[].obs;
  late TextEditingController controller;
  Rx<bool> isSearch = false.obs;

  @override
  void onInit() {
    super.onInit();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void fetchCharitiesBySearch(String s) async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchCharitiesBySearch(s);
      if (products.isNotEmpty) {
        charityList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  void toggleIsSearch() => isSearch(!isSearch.value);
}
