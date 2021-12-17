import 'package:get/state_manager.dart';
import 'package:charity/models/charity_info.dart';
import 'package:charity/services/charity_watch_api.dart';

class CharityController extends GetxController {
  final _isLoading = true.obs;
  final _charityList = <Charity>[].obs;

  @override
  void onInit() {
    _fetchCharities();
    super.onInit();
  }

  bool get isLoading => _isLoading.value;
  List<Charity> get charityList => _charityList;

  void _fetchCharities() async {
    try {
      _isLoading(true);
      var products = await CharityRemoteServices.fetchCharities();
      if (products.isNotEmpty) {
        _charityList.value = products;
      }
    } finally {
      _isLoading(false);
    }
  }

  void fetchCharitiesByCategory(int i) async {
    try {
      _isLoading(true);
      var products = await CharityRemoteServices.fetchCharitiesByCategory(i);
      if (products.isNotEmpty) {
        _charityList.value = products;
      }
    } finally {
      _isLoading(false);
    }
  }
}
