import 'package:flutter_getx_pattern/src/app/data/model/blog.dart';
import 'package:flutter_getx_pattern/src/app/data/repository/blog_repository.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  BlogRepository _repository = BlogRepository();

  List<Blog> list = [];
  fetchBlog() async {
    list = await _repository.fetchBlog();
    update();
  }

  List<Blog> searchQuery(String search) {
    var _searchList = list
        .where(
            (item) => item.title.toLowerCase().contains(search.toLowerCase()))
        .toList();
    return _searchList;
  }
}
