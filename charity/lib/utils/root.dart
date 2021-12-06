import 'package:charity/controller/auth_controller.dart';
import 'package:charity/controller/user_controller.dart';
import 'package:charity/pages/home.dart';
import 'package:charity/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
