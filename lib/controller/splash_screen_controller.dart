import 'dart:async';
import 'package:get/get.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:to_do/screens/splash_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    homepage();
    super.onInit();
  }

  homepage() async {
    //await loginController.removeToken();
    Timer(Duration(seconds: 3), () {
      Get.off(() => HomePage());
    });
  }
}
