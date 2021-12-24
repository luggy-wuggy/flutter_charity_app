import 'package:charity/controller/modules/authentication/auth_controller.dart';
import 'package:charity/models/favorite_charity.dart';
import 'package:charity/services/database.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final RxList<FavoriteCharity> _favoriteCharities = RxList<FavoriteCharity>();

  List<FavoriteCharity> get favoriteCharities => _favoriteCharities;

  @override
  void onInit() {
    super.onInit();
    String uid = Get.find<AuthController>().user!.uid;
    _favoriteCharities.bindStream(Database().favoritesStream(uid));
  }

  void printCharities() {
    print('NUMBER OF CHARITIES: ${_favoriteCharities.length}');
    print("================================================");
    for (var charity in _favoriteCharities) {
      print('ID: ${charity.ein}');
      print('NAME: ${charity.title}');
      print('CATEGORY: ${charity.category}');
      print('date: ${charity.date}');
    }
    print("================================================");
  }
}
