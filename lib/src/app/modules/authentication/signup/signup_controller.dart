import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/data/repository/authentication/authentication_respository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  AuthenticationRepository repository = AuthenticationRepository();

  var isLoading = false.obs;

  signup(email, password, username, phone) async {
    isLoading.value = true;
    var check = await repository.signUp(email, password, username, phone);
    if (check == 'success') {
      Get.snackbar(
        'Notification',
        'Sign up account successfully',
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
}
