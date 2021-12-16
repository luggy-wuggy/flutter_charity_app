import 'package:get/state_manager.dart';
import 'package:charity/models/charity_info.dart';
import 'package:charity/services/charity_watch_api.dart';

class CharityController extends GetxController {
  var isLoading = true.obs;
  var charityList = <Charity>[].obs;
  //List<Charity> charityList = List.empty().obs as List<Charity>;

  @override
  void onInit() {
    fetchCharities();
    super.onInit();
  }

  void fetchCharities() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchCharities();
      if (products.isNotEmpty) {
        charityList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchCharitiesByCategory(int i) async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchCharitiesByCategory(i);
      if (products.isNotEmpty) {
        charityList.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
