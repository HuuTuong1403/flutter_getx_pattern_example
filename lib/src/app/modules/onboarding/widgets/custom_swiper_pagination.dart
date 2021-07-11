import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/routes/app_pages.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class CustomSwiperBuild extends SwiperPlugin {
  final Color? activeColor;
  final Color? color;
  final Size activeSize;
  final Size size;
  final double space;
  final Key? key;
  final SwiperController? swiperController;
  final int? currentIndex;

  const CustomSwiperBuild(
      {this.activeColor,
      this.color,
      this.activeSize = const Size(23, 8),
      this.size = const Size(8, 8),
      this.swiperController,
      this.space = 3.0,
      this.currentIndex,
      this.key});

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    List<Widget> lists = [];

    if (config.itemCount > 20) {
      print('So big');
    }
    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;
    for (int i = 0; i < itemCount; i++) {
      bool active = i == activeIndex;
      Size size = active ? this.activeSize : this.size;
      lists.add(SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
            decoration: BoxDecoration(
              color: active ? activeColor : color,
              borderRadius: BorderRadius.circular(26),
            ),
            key: Key('pagination_$i'),
            margin: EdgeInsets.all(space)),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: lists,
      );
    } else {
      return Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: [
          ...lists,
          Spacer(),
          Expanded(
            flex: 1,
            child: Container(
              width: 30,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0),
                onPressed: () {
                  if (this.currentIndex == 2) {
                    Get.toNamed(Routes.AUTHENTICATION);
                  } else {
                    this.swiperController!.next();
                  }
                },
                child: Icon(this.currentIndex == 2
                    ? Icons.check
                    : Icons.keyboard_arrow_right),
              ),
            ),
          ),
        ],
      );
    }
  }
}
