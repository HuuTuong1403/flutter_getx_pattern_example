import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFBBC6D7),
            ),
          ),
        ],
      ),
    );
  }
}
