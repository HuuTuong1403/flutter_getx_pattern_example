import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/data/model/blog.dart';
import 'package:flutter_getx_pattern/src/routes/app_pages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemSearchBlog extends StatefulWidget {
  final Blog blog;
  ItemSearchBlog({Key? key, required this.blog}) : super(key: key);

  @override
  _ItemSearchBlogWidgetState createState() => _ItemSearchBlogWidgetState();
}

class _ItemSearchBlogWidgetState extends State<ItemSearchBlog> {
  String timeAgo = '';
  changeTime() {
    var t = widget.blog.createAt;
    var now = Timestamp.now();
    var time = ((now.seconds - t.seconds) / 60).ceil();
    if (time < 60) {
      timeAgo = '${time}m ago';
    } else {
      time = (time / 60).ceil();
      if (time < 24) {
        timeAgo = '${time}hr ago';
      } else {
        time = (time / 24).ceil();
        timeAgo = '${time}day ago';
      }
    }
  }

  @override
  void initState() {
    super.initState();
    changeTime();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 5,
          )
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.DETAILBLOG, arguments: [widget.blog, timeAgo]);
          },
          splashColor: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage('${widget.blog.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.blog.title}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.bodyText2!.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '${widget.blog.subTitle}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.thumbsUp,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              const SizedBox(width: 5),
                              Text(
                                '2.1k',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.clock,
                                  size: 18,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color),
                              const SizedBox(width: 5),
                              Text(
                                '$timeAgo',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .color,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.bookmark_rounded,
                              size: 18,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
