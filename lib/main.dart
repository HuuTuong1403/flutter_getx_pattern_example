import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_page.dart';
import 'package:flutter_getx_pattern/src/core/theme/theme_service.dart';
import 'package:flutter_getx_pattern/src/core/theme/themes.dart';
import 'package:flutter_getx_pattern/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            home: SplashPage(),
          );
        } else if (snapshot.hasError) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error occured'),
              ),
            ),
          );
        }
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.ROOT,
          theme: Themes().lightTheme,
          darkTheme: Themes().darkTheme,
          themeMode: ThemeService().getThemeMode(),
          defaultTransition: Transition.fade,
          getPages: AppPages.pages,
        );
      },
    );
  }
}
