
import 'package:easy_localization/easy_localization.dart';
import 'package:fairshop/routes/AppPages.dart';
import 'package:fairshop/theme/app_theme.dart';
import 'package:fairshop/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nb_utils/nb_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var lang = prefs.getString("Lang") ?? "bn";
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    EasyLocalization(
      supportedLocales: [Locale("en"),Locale("tr")],
      path: "assets/language",
      fallbackLocale: Locale("en"),
      child: MyApp(),
    )

  );
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.offset
    ..maskType = EasyLoadingMaskType.black;
}

class MyApp extends StatelessWidget {


  MyApp();
  CustomTheme customTheme=AppTheme.customTheme;
  ThemeData theme=AppTheme.theme;


  @override
  Widget build(BuildContext context) {
    setStatusBarColor(theme.colorScheme.primary.withAlpha(100));
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Something',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      builder: EasyLoading.init(),
      theme: ThemeData(
        // primarySwatch: materialPrimaryColors,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
            linearTrackColor: Color(0xFFFD41B4),
            color: Color(0xFF6A05FE),
            refreshBackgroundColor: Color(0xFFF37B46)),
      ),

      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
