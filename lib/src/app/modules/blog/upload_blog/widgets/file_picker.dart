import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../upload_blog_controller.dart';

class FilePickerWidget extends StatelessWidget {
  final UploadBlogController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.grey.shade200,
              onTap: () async {
                _controller.pickFile();
              },
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.mobile,
                  color: Colors.green,
                ),
                title: Text(
                  'Phone',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _controller.file != null
                  ? () {
                      _controller.removeFile();
                    }
                  : () {},
              splashColor: Colors.grey.shade200,
              child: ListTile(
                leading: Icon(
                  Icons.remove_circle,
                  color: _controller.file != null ? Colors.red : Colors.grey,
                ),
                title: Text(
                  'Remove Image',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
