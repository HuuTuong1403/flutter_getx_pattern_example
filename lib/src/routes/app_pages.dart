import 'package:flutter_getx_pattern/src/app.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/authentication_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/login/login_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/authentication/signup/signup_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/menu/menu_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/navigation/navigation_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/stories/stories_detail_page.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static const INITIAL = Routes.ROOT;

  static final pages = [
    GetPage(name: Routes.ROOT, page: () => MyApp(), children: []),
    GetPage(name: Routes.SPLASH, page: () => SplashPage(), children: []),
    GetPage(
      name: Routes.AUTHENTICATION,
      page: () => AuthenticationPaeg(),
      children: [],
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginPage(),
      children: [],
    ),
    GetPage(
      name: Routes.NAVIGATION,
      page: () => Navigationpage(),
      children: [],
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => SignUpPage(),
      children: [],
    ),
    GetPage(
      name: Routes.STORIES,
      page: () => StoriesDetailPage(),
      children: [],
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuPage(),
      children: [],
    ),
  ];
}
