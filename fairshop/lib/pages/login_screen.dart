import 'package:fairshop/controller/login_controller.dart';
import 'package:fairshop/pages/home_screen.dart';
import 'package:fairshop/session_manager/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  final LoginController controller = Get.put(LoginController());
  SessionManager pref=SessionManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                pref.setIsLogin(true);
                Get.offAll(()=>HomeScreen());

              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
