import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_binding.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_page.dart';
import 'package:flutter_getx_pattern/src/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: Routes.INITIAL,
    // theme: appThemeData,
    defaultTransition: Transition.fade,
    initialBinding: SplashBinding(),
    getPages: AppPages.pages,
    home: SplashPage(),
  ));
}
