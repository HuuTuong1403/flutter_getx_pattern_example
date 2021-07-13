import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/user_state/user_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 1)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashPage();
        } else {
          return UserState();
        }
      },
    );
  }
}
