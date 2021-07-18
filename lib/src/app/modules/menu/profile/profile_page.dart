import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/menu/profile/profile_controller.dart';
import 'package:flutter_getx_pattern/src/app/modules/menu/profile/widgets/my_post_widget.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _tabIndex = Get.arguments[0]['tabIndex'];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        controller.fetchBlogOfUser();
        controller.getDataOfUser();
        return controller.isLoading
            ? Scaffold(body: Center(child: CircularProgressIndicator()))
            : DefaultTabController(
                initialIndex: _tabIndex,
                length: 3,
                child: Scaffold(
                  backgroundColor: Theme.of(context).primaryColor,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    title: Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                      ),
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).textTheme.headline1!.color,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                          top: 15,
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: Tooltip(
                            message: 'Menu',
                            child: InkWell(
                              onTap: () {},
                              splashColor: Colors.grey.shade200,
                              child: Icon(
                                Icons.more_horiz,
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1!
                                    .color,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  body: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(30),
                        height: 350,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 280,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xFF9CECFB),
                                                        Color(0xFF49B0E2),
                                                        Color(0xFF376AED),
                                                      ],
                                                      begin: Alignment
                                                          .bottomCenter,
                                                      end: Alignment.topCenter),
                                                ),
                                              ),
                                              Positioned(
                                                top: 5,
                                                left: 5,
                                                child: Container(
                                                  width: 90,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 15,
                                                left: 15,
                                                child: Container(
                                                  height: 70,
                                                  width: 70,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/imageTitle1.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '@joviedan',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1!
                                                        .color,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  '${controller.user!.username}',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .headline1!
                                                        .color,
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  'UX Designer',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .color,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        'About me',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Theme.of(context)
                                              .textTheme
                                              .headline1!
                                              .color,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Madison Blackstone is a director of user experience design, with experience managing global teams.',
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
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                width: double.infinity,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Colors.blue,
                                ),
                                child: TabBar(
                                  indicator: ShapeDecoration(
                                    shape: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(16),
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 0,
                                          style: BorderStyle.solid),
                                    ),
                                    color: Color(0xFF2151CD),
                                  ),
                                  tabs: [
                                    Tab(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${controller.listBlog.length}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Post',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '250',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Following',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '4.5K',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Followers',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                          ),
                          child: TabBarView(children: [
                            controller.listBlog.length == 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 30),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.checklist),
                                        const SizedBox(width: 10),
                                        Text(
                                          'You don\'t have any blog',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context)
                                                .textTheme
                                                .headline1!
                                                .color,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : MyPostWidget(),
                            Text('Tab 2'),
                            Text('Tab 3'),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
