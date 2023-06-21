import 'dart:async';
import 'package:get/get.dart';
import 'package:to_do/controller/listview_controller.dart';
import 'package:to_do/controller/sp_handler.dart';
import 'package:to_do/screens/home_page.dart';
import 'package:to_do/screens/splash_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    SpHandler spHandler = SpHandler();
    ListviewController listviewController = Get.put(ListviewController());
    await spHandler.loadData();
    await spHandler.removeData();
    timeDuration();
    super.onInit();
  }

  timeDuration() async {
    //await loginController.removeToken();
    Timer(Duration(seconds: 3), () {
      Get.to(() => HomePage());
    });
  }
}
