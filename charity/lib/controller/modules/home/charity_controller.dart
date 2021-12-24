import 'package:charity/controller/modules/home/category_controller.dart';
import 'package:get/get.dart';
import 'package:charity/models/charity_info.dart';
import 'package:charity/services/charity_watch_api.dart';

class CharityController extends GetxController {
  final _isLoading = true.obs;

  @override
  void onInit() {
    _fetchInitialCharities();
    super.onInit();
  }

  bool get isLoading => _isLoading.value;

  void _fetchInitialCharities() async {
    try {
      _isLoading(true);
      var products = await CharityRemoteServices.fetchCharities();
      if (products.isNotEmpty) {
        Get.find<CategoryController>().categories[0].charityList = products;
      }
    } finally {
      _isLoading(false);
    }
  }

  Future<List<Charity>> fetchCharitiesByCategory(int i) async {
    try {
      _isLoading(true);
      var products = await CharityRemoteServices.fetchCharitiesByCategory(i);
      if (products.isNotEmpty) {
        _isLoading(false);
        return products;
      }
    } catch (e) {
      return [];
    }
    return [];
  }
}
