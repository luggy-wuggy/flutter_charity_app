import 'package:charity/bindings/home_bindings.dart';
import 'package:charity/controller/user_controller.dart';
import 'package:charity/models/user.dart';
import 'package:charity/pages/home.dart';
import 'package:charity/pages/login.dart';
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
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(
        () => LoginPage(),
      );
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offAll(() => HomePage(), binding: HomeBinding());
    }
  }

  // @override
  // void onInit() {
  //   _firebaseUser.bindStream(_auth.authStateChanges());
  //   super.onInit();
  // }

  void createUser(String name, String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      UserModel _user = UserModel(
        id: _authResult.user?.uid,
        name: name,
        email: email,
      );

      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.offAllNamed('/');
      }
    } catch (e) {
      Get.snackbar(
        'Error creating account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.find<UserController>().user = await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar(
        'Error logging in',
        e.toString(),
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
