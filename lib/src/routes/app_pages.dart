import 'package:flutter_getx_pattern/src/app/modules/splash/splash_binding.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.SPLASH, page:()=> SplashPage(), binding: SplashBinding()),
  ];
}