import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/core/values/colors.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
      primaryColor: colorPrimary,
      backgroundColor: colorPrimary,
      primaryIconTheme: IconThemeData(color: titleText1),
      textTheme: TextTheme(
        headline1: TextStyle(color: titleText1),
        bodyText1: TextStyle(color: contentText1),
        bodyText2: TextStyle(color: contentText2),
      ),
      brightness: Brightness.light);

  final darkTheme = ThemeData.dark().copyWith(
    brightness: Brightness.dark,
  );
}
