import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:charity/models/charity_info.dart';
import 'package:charity/services/charity_watch_api.dart';

class CharitySearchController extends GetxController {
  final Rx<bool> _isLoading = false.obs;
  final Rx<bool> _isSearch = false.obs;
  final RxList<Charity> _charityList = <Charity>[].obs;
  final TextEditingController _textController = TextEditingController();

  bool get isLoading => _isLoading.value;
  bool get isSearch => _isSearch.value;
  List<Charity> get charityList => _charityList;
  TextEditingController get textController => _textController;

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  void fetchCharitiesBySearch(String s) async {
    try {
      _isLoading(true);
      var products = await CharityRemoteServices.fetchCharitiesBySearch(s);
      if (products.isNotEmpty) {
        _charityList.value = products;
      }
    } finally {
      _isLoading(false);
    }
  }

  void toggleIsSearch() => _isSearch(!_isSearch.value);
}
