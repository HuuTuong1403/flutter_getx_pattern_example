import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/home/home_controller.dart';
import 'package:flutter_getx_pattern/src/app/modules/home/widgets/category_items_widget.dart';
import 'package:flutter_getx_pattern/src/app/modules/home/widgets/lastest_news_item_widget.dart';
import 'package:flutter_getx_pattern/src/app/modules/home/widgets/story_items_widget.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = Get.put(HomeController(), permanent: true);
  @override
  void initState() {
    super.initState();
    _homeController.getDataOfUser();
    _homeController.fetchBlog();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: _homeController,
        builder: (controller) {
          return _homeController.isLoading
              ? Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    toolbarHeight: 100,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    leading: null,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${_homeController.user!.username}!',
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                          Text(
                            'Explore today\'s',
                            style: TextStyle(
                              fontSize: 24,
                              color:
                                  Theme.of(context).textTheme.headline1!.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications_outlined,
                            size: 32,
                            color: Theme.of(context).textTheme.headline1!.color,
                          ),
                        ),
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          height: 150,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return StoryItemsWidget();
                            },
                          ),
                        ),
                        Container(
                          height: 276,
                          width: double.infinity,
                          child: Swiper(
                            itemCount: 10,
                            scrollDirection: Axis.horizontal,
                            scale: 0.9,
                            viewportFraction: 0.75,
                            loop: false,
                            itemBuilder: (context, index) {
                              return CategoryItemsWidget();
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Lastest News',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .color,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'More',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .color,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height *
                              0.22 *
                              _homeController.listBlog.length,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: _homeController.listBlog.length,
                            itemBuilder: (context, index) {
                              return LastestNewsItemWidget(
                                  blog: _homeController.listBlog[index]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        });
  }
}
