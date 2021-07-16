import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_pattern/src/app/modules/blog/upload_blog/upload_blog_controller.dart';
import 'package:flutter_getx_pattern/src/app/modules/blog/upload_blog/widgets/file_picker.dart';
import 'package:flutter_getx_pattern/src/app/modules/blog/upload_blog/widgets/image_pick.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class UploadBlogPage extends StatefulWidget {
  UploadBlogPage({Key? key}) : super(key: key);

  @override
  _UploadBlogPageState createState() => _UploadBlogPageState();
}

class _UploadBlogPageState extends State<UploadBlogPage> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _articleTitleFocus = FocusNode();
  FocusNode _articleSubTitleFocus = FocusNode();
  FocusNode _articleContentFocus = FocusNode();

  TextEditingController _articleTitleController = TextEditingController();
  TextEditingController _articleSubTitleController = TextEditingController();
  TextEditingController _articleContentController = TextEditingController();

  String _articleTitle = '';
  String _articleSubTitle = '';
  String _articleContent = '';

  bool active = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _articleTitleFocus.dispose();
    _articleSubTitleFocus.dispose();
    _articleContentFocus.dispose();

    _articleTitleController.dispose();
    _articleSubTitleController.dispose();
    _articleContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadBlogController>(
      init: UploadBlogController(),
      builder: (controller) {
        _buildListTags();
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            setState(() {
              active = false;
            });
          },
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                  top: 15,
                ),
                child: Text(
                  'New Article',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).textTheme.headline1!.color,
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                    top: 15,
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: Tooltip(
                      message: 'Upload Blog',
                      child: InkWell(
                        onTap: () async {
                          var isValid = _formKey.currentState!.validate();
                          if (isValid) {
                            _formKey.currentState!.save();
                            var check = await controller.uploadBlog(
                                _articleTitle,
                                _articleSubTitle,
                                'Art',
                                _articleContent);
                            if (check) {
                              Get.snackbar(
                                  'Notifications', 'Upload Blog Success');
                              _articleTitleController.clear();
                              _articleSubTitleController.clear();
                              _articleContentController.clear();
                              controller.removeImage();
                            }
                          }
                        },
                        splashColor: Colors.grey.shade200,
                        child: Obx(() => controller.isLoading.value
                            ? CircularProgressIndicator()
                            : Icon(
                                Icons.upload,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .color,
                                size: 32,
                              )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: controller.image == null ? false : true,
                        child: controller.image == null
                            ? Container()
                            : Container(
                                height: 200,
                                width: double.infinity,
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                  child: Image.file(
                                    controller.image!,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.center,
                                  ),
                                ),
                              ),
                      ),
                      TextFormField(
                        key: ValueKey('ArticleTitle'),
                        focusNode: _articleTitleFocus,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Title Blog is not empty';
                          }
                          return null;
                        },
                        controller: _articleTitleController,
                        style: TextStyle(
                          fontSize: 22,
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontWeight: FontWeight.w800,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Article Title',
                          hintStyle: TextStyle(
                            fontSize: 22,
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () => FocusScope.of(context)
                            .requestFocus(_articleSubTitleFocus),
                        onChanged: (text) {
                          _articleTitle = text;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: TextFormField(
                          key: ValueKey('ArticleSubTitle'),
                          focusNode: _articleSubTitleFocus,
                          controller: _articleSubTitleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter sub title blog';
                            }
                            return null;
                          },
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Article SubTitle',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_articleContentFocus),
                          onChanged: (text) {
                            _articleSubTitle = text;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5,
                        children: [
                          Chip(
                            backgroundColor: Colors.transparent,
                            label: Text('Add Tags'),
                            labelStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color:
                                  Theme.of(context).textTheme.bodyText2!.color,
                            ),
                          ),
                          ...list
                        ],
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context)
                              .requestFocus(_articleContentFocus);
                          setState(() {
                            active = true;
                          });
                        },
                        child: Text(
                          'Article Content',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.headline1!.color,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      AnimatedOpacity(
                        opacity:
                            active ? 1 : (_articleContent.isNotEmpty ? 1 : 0),
                        duration: Duration(milliseconds: 1000),
                        child: Visibility(
                          visible: active
                              ? true
                              : (_articleContent.isNotEmpty ? true : false),
                          child: TextFormField(
                            key: ValueKey('ArticleContent'),
                            focusNode: _articleContentFocus,
                            controller: _articleContentController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter content blog';
                              }
                              return null;
                            },
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Write content here',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .color,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            maxLines: 10,
                            textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            onChanged: (text) {
                              _articleContent = text;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: controller.file != null ? true : false,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 10),
                              Icon(FontAwesomeIcons.file),
                              const SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  controller.file != null
                                      ? '${controller.file!.path.split('/').last}'
                                      : '',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomSheet: Container(
              width: double.infinity,
              height: 50,
              margin: const EdgeInsets.fromLTRB(45, 0, 45, 40),
              decoration: BoxDecoration(
                color: Theme.of(context).textTheme.headline1!.color,
                borderRadius: BorderRadius.circular(60),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(left: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(30),
                      splashColor: Colors.black38,
                      child: Icon(
                        Icons.close,
                        color: Theme.of(context).textTheme.headline1!.color,
                        size: 24,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        controller.checkStatus(
                          showModal: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return ImagePickWidgets();
                              },
                            );
                          },
                        );
                      },
                      splashColor: Colors.grey.shade400,
                      child: Icon(
                        Icons.image_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.grey.shade400,
                      child: Icon(
                        Icons.play_circle_outline,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.grey.shade400,
                      child: Icon(
                        Icons.align_horizontal_left_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        controller.checkStatus(
                          showModal: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return FilePickerWidget();
                              },
                            );
                          },
                        );
                      },
                      splashColor: Colors.grey.shade400,
                      child: Icon(
                        FontAwesomeIcons.link,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        splashColor: Colors.grey.shade400,
                        child: Icon(
                          Icons.format_size_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  var listString = ['Art', 'Culture', 'Design', 'Production'];
  var list = [];
  void _buildListTags() {
    list = listString.map((e) {
      return Chip(
        backgroundColor: Colors.transparent,
        label: Text(e),
        deleteIcon: Icon(
          Icons.cancel,
          color: Theme.of(context).textTheme.bodyText2!.color,
        ),
        labelStyle: TextStyle(
          fontSize: 14,
          color: Theme.of(context).textTheme.bodyText2!.color,
        ),
        onDeleted: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(75),
          side: BorderSide(
            color: Colors.blue,
            width: 2,
          ),
        ),
      );
    }).toList();
  }
}
