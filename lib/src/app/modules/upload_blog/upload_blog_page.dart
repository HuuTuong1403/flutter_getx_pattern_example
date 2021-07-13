import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Scaffold(
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
              child: InkWell(
                onTap: () {},
                splashColor: Colors.grey.shade200,
                child: Icon(
                  Icons.download,
                  color: Theme.of(context).textTheme.headline1!.color,
                  size: 32,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                key: ValueKey('ArticleTitle'),
                focusNode: _articleTitleFocus,
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
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_articleSubTitleFocus),
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
                  style: TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Article SubTitle',
                    hintStyle: TextStyle(
                      fontSize: 18,
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () =>
                      FocusScope.of(context).requestFocus(_articleContentFocus),
                  onChanged: (text) {
                    _articleSubTitle = text;
                  },
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_articleContentFocus);
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
              TextFormField(
                key: ValueKey('ArticleContent'),
                focusNode: _articleContentFocus,
                controller: _articleContentController,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).textTheme.headline1!.color,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                maxLines: 10,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                onEditingComplete: () =>
                    FocusScope.of(context).requestFocus(_articleContentFocus),
                onChanged: (text) {
                  _articleContent = text;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
