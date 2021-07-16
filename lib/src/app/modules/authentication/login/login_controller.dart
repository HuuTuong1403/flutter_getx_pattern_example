import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/data/repository/authentication_respository.dart';
import 'package:get/get.dart';

class LogInPageController extends GetxController {
  AuthenticationRepository repository = AuthenticationRepository();

  var isLoading = false.obs;

  login(email, password) async {
    isLoading.value = true;
    var check = await repository.login(email, password);
    if (check == 'success') {
      Get.snackbar(
        'Notification',
        'Log In successfully',
        backgroundColor: Colors.greenAccent,
        colorText: Colors.black,
        duration: Duration(milliseconds: 2000),
      );
      isLoading.value = false;
      return true;
    } else {
      Get.snackbar(
        'Error ocurred',
        '${check.message}',
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        duration: Duration(milliseconds: 2000),
      );
      isLoading.value = false;
      return false;
    }
  }

  validateEmail(v) => GetUtils.isEmail(v) ? null : 'Email is invalid';
  validatePassword(String v) =>
      v.length < 8 || v.isEmpty ? 'Password is invalid.' : null;
}
