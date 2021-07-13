import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/stories/widgets/custom_pagination_stories.dart';
import 'package:flutter_getx_pattern/src/app/modules/stories/widgets/detail_stories.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class StoriesDetailPage extends StatefulWidget {
  StoriesDetailPage({Key? key}) : super(key: key);

  @override
  _StoriesDetailPageState createState() => _StoriesDetailPageState();
}

class _StoriesDetailPageState extends State<StoriesDetailPage> {
  final SwiperController _swiperController = SwiperController();
  int _currentIndex = 0;
  int _pageCount = 3;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Swiper(
                  loop: false,
                  itemCount: _pageCount,
                  index: _currentIndex,
                  controller: _swiperController,
                  onIndexChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  physics: NeverScrollableScrollPhysics(),
                  onTap: (index) {
                    setState(() {
                      if (index == _pageCount - 1) {
                        Get.back();
                      } else {
                        _currentIndex = index;
                        _swiperController.next();
                      }
                    });
                  },
                  pagination: SwiperPagination(
                    margin: const EdgeInsets.symmetric(vertical: 50),
                    alignment: Alignment.topCenter,
                    builder: CustomSwiperStories(
                      activeColor: Colors.white,
                      color: Colors.white.withOpacity(0.29),
                      size: Size(93.0, 10),
                      activeSize: Size(93.0, 10),
                      swiperController: _swiperController,
                      currentIndex: _currentIndex,
                    ),
                  ),
                  itemBuilder: (context, index) {
                    return DetailStories();
                  },
                ),
                Positioned(
                  left: 40,
                  top: 60,
                  right: 40,
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 52,
                              height: 54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/imageTitle2.png'),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'Jasmine Levin',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  '4m ago',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            splashColor: Colors.grey.shade400,
                            child: Icon(Icons.close,
                                color: Colors.white, size: 32),
                            onTap: () {
                              Get.back();
                            },
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
            flex: 1,
            child: Container(
              margin: const EdgeInsets.fromLTRB(80, 10, 40, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Color(0xFF8FE6FF),
                      ),
                      const SizedBox(height: 5),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 15),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Read More',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).textTheme.bodyText2!.color,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 40,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '450k',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
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
    );
  }
}
