import 'package:charity/controller/modules/authentication/auth_controller.dart';
import 'package:charity/models/charity_info.dart';
import 'package:charity/models/favorite_charity.dart';
import 'package:charity/services/database.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final _favoriteCharities = <FavoriteCharity>[].obs;

  List<FavoriteCharity> get favoriteCharities => _favoriteCharities;

  @override
  void onInit() {
    super.onInit();
    String uid = Get.find<AuthController>().user!.uid;
    _favoriteCharities.bindStream(Database().favoritesStream(uid));
  }

  bool charityContainsFavorite(Charity charity) {
    return _favoriteCharities.map((e) => e.ein).toList().contains(charity.ein);
  }
}
