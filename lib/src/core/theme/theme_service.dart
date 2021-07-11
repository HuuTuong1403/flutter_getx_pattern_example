import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _getStorage = GetStorage();
  final storageKey = 'isDark';

  switchStatusColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness:
          isSavedDarkMode() ? Brightness.light : Brightness.dark,
      statusBarIconBrightness:
          isSavedDarkMode() ? Brightness.light : Brightness.dark,
    ));
  }

  ThemeMode getThemeMode() {
    switchStatusColor();
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  bool isSavedDarkMode() {
    return _getStorage.read(storageKey) ?? false;
  }

  void saveThemeMode(bool isDark) {
    _getStorage.write(storageKey, isDark);
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSavedDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeMode(!isSavedDarkMode());
    switchStatusColor();
  }
}
