import 'package:fairshop/pages/home_screen.dart';
import 'package:fairshop/pages/login_screen.dart';
import 'package:fairshop/routes/AppPages.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../session_manager/session_manager.dart';

class SplashController extends GetxController {
  SessionManager prefs = SessionManager();
  final isLogin = false.obs;

  @override
  void onInit() {
    _getIsLogin();
    super.onInit();
  }

  _getIsLogin() async {
    isLogin.value = await prefs.getIsLogin();
    await Future.delayed(Duration(seconds: 1));
    if (!isLogin.value) {
      Get.toNamed(AppPages.getHomeRoute());
    } else {
      Get.toNamed(AppPages.getHomeRoute());
    }
  }
}
