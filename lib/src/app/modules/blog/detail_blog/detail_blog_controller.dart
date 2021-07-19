import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_getx_pattern/src/app/data/model/user_local.dart';
import 'package:flutter_getx_pattern/src/app/data/repository/blog_repository.dart';
import 'package:get/get.dart';

class DetailBlogController extends GetxController {
  BlogRepository _blogRespository = BlogRepository();
  bool isLoading = true;
  UserLocal? user;
  getDataOfUser(String uid) async {
    DocumentSnapshot userDoc = await _blogRespository.getDataUserOfBlog(uid);
    user = UserLocal(
        id: userDoc.get('id'),
        email: userDoc.get('email'),
        phone: userDoc.get('phone'),
        username: userDoc.get('username'));
    isLoading = false;
    update();
  }
}
