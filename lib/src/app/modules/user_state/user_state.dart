import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/navigation/navigation_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/onboarding/onboarding_page.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_page.dart';

class UserState extends StatelessWidget {
  const UserState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashPage();
        } else if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Navigationpage();
          } else {
            return OnBoarding();
          }
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error occured'),
          );
        }
        return SplashPage();
      },
    );
  }
}
