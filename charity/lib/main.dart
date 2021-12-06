import 'package:charity/bindings/auth_bindings.dart';
import 'package:charity/bindings/home_bindings.dart';
import 'package:charity/controller/auth_controller.dart';
import 'package:charity/controller/user_controller.dart';
import 'package:charity/pages/home.dart';
import 'package:charity/pages/login.dart';
import 'package:charity/pages/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
    Get.put(UserController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(),
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      getPages: [
        GetPage(name: "/", page: () => HomePage(), binding: HomeBinding()),
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/signup", page: () => SignUpPage()),
      ],
    );
  }
}
