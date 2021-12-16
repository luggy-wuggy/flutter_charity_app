import 'package:charity/controller/bindings/home_bindings.dart';
import 'package:charity/controller/page2_controller.dart';
import 'package:charity/controller/user_controller.dart';
import 'package:charity/models/user.dart';
import 'package:charity/pages/home.dart';
import 'package:charity/pages/onboard.dart';
import 'package:charity/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> _firebaseUser = Rxn<User>();

  User? get user => _firebaseUser.value;

  @override
  void onReady() {
    super.onReady();
    _firebaseUser.bindStream(_auth.authStateChanges());
    ever(_firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => OnboardPage());
    } else {
      Get.offAll(() => HomePage(), binding: HomeBinding());
    }
  }

  void createUser(String location) async {
    if (location != '') {
      try {
        UserCredential _authResult = await FirebaseAuth.instance.signInAnonymously();

        UserModel _user = UserModel(
          id: _authResult.user?.uid,
          place: Get.find<Page2Controller>().placeDetails,
          date: DateTime.now(),
        );

        if (await Database().createNewUser(_user)) {
          Get.find<UserController>().user = _user;
        }
      } catch (e) {
        Get.snackbar(
          'Error creating account',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error creating account',
        "Input a location",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar(
        'Error signing out',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
