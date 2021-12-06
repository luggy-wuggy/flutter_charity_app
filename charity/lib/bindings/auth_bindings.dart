import 'package:charity/controller/auth_controller.dart';
import 'package:charity/controller/user_controller.dart';
import 'package:get/instance_manager.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    //Get.put(UserController());
  }
}
