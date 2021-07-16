import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/menu/profile/profile_controller.dart';
import 'package:flutter_getx_pattern/src/app/modules/menu/profile/widgets/my_post_item.dart';
import 'package:get/get.dart';

class MyPostWidget extends StatefulWidget {
  MyPostWidget({Key? key}) : super(key: key);

  @override
  _MyPostWidgetState createState() => _MyPostWidgetState();
}

class _MyPostWidgetState extends State<MyPostWidget> {
  ProfileController _blogController = Get.find();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'My Posts',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Icon(
                      Icons.grid_view,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Icon(
                      Icons.toc,
                      color: Color(0xFF7B8BB2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height *
                  0.22 *
                  _blogController.listBlog.length,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _blogController.listBlog.length,
                itemBuilder: (context, index) {
                  return MyPostItemWidget(
                      blog: _blogController.listBlog[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
