import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_getx_pattern/src/app/data/model/blog.dart';
import 'package:flutter_getx_pattern/src/app/data/model/user_local.dart';
import 'package:flutter_getx_pattern/src/app/data/repository/blog_repository.dart';
import 'package:flutter_getx_pattern/src/app/data/repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  BlogRepository _respository = BlogRepository();
  UserRepository _userRepository = UserRepository();
  bool isLoading = true;

  List<Blog> listBlog = [];
  fetchBlogOfUser() async {
    listBlog = await _respository.fetchBlogOfUser();
    update();
  }

  UserLocal? user;
  getDataOfUser() async {
    DocumentSnapshot userDoc = await _userRepository.getDataOfUser();
    user = UserLocal(
        id: userDoc.get('id'),
        email: userDoc.get('email'),
        phone: userDoc.get('phone'),
        username: userDoc.get('username'));
    isLoading = false;
    update();
  }
}
