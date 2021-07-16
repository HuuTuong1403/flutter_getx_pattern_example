import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/blog/upload_blog/upload_blog_controller.dart';
import 'package:get/get.dart';
class ImagePickWidgets extends StatefulWidget {
  ImagePickWidgets({Key? key}) : super(key: key);

  @override
  _ImagePickWidgetsState createState() => _ImagePickWidgetsState();
}

class _ImagePickWidgetsState extends State<ImagePickWidgets> {
  final UploadBlogController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.grey.shade200,
              onTap: () async {
                _controller.pickImageFromCamera();
              },
              child: ListTile(
                leading: Icon(
                  Icons.camera,
                  color: Colors.green,
                ),
                title: Text(
                  'Camera',
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
              splashColor: Colors.grey.shade200,
              onTap: () {
                _controller.pickImageFromGallery();
              },
              child: ListTile(
                leading: Icon(
                  Icons.image,
                  color: Colors.pink,
                ),
                title: Text(
                  'Gallery',
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
              onTap: () {
                _controller.removeImage();
              },
              splashColor: Colors.grey.shade200,
              child: ListTile(
                leading: Icon(
                  Icons.remove_circle,
                  color: Colors.red,
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
