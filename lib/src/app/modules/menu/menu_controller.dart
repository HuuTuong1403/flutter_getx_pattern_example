import 'package:flutter_getx_pattern/src/app/data/repository/user_respository.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  UserRepository _repository = UserRepository();

  logout() async {
    try {
      _repository.logOut();
    } catch (e) {
      Get.snackbar('Error occured', 'Logout failed');
    }
    update();
  }
}
