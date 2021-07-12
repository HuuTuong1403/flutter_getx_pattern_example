import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/onboarding/widgets/custom_swiper_pagination.dart';
import 'package:flutter_getx_pattern/src/core/values/colors.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final SwiperController _swiperController = SwiperController();
  final int _pageCount = 3;
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 92,
                        height: 158,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 20,
                              offset: Offset(5, 10),
                              spreadRadius: 1,
                            )
                          ],
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/imageTitle1.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 191,
                        height: 158,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 20,
                              offset: Offset(5, 10),
                              spreadRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/imageTitle2.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: 191,
                        height: 158,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 20,
                              offset: Offset(5, 10),
                              spreadRadius: 1,
                            )
                          ],
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/imageTitle3.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 92,
                        height: 158,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 20,
                              offset: Offset(5, 10),
                              spreadRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/imageTitle4.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.39,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Swiper(
                      itemCount: _pageCount,
                      index: _currentIndex,
                      controller: _swiperController,
                      onIndexChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      loop: false,
                      itemBuilder: (context, index) {
                        return _buildPage(index);
                      },
                      pagination: SwiperPagination(
                        alignment: Alignment.bottomLeft,
                        builder: CustomSwiperBuild(
                          activeColor: Colors.blue,
                          color: inactiveBoarding,
                          size: Size(16, 16),
                          activeSize: Size(46, 16),
                          swiperController: _swiperController,
                          currentIndex: _currentIndex,
                        ),
                      ),
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

  List<String> title = [
    'Read the article you want instantly',
    'Write the article you want instantly',
    'Like the article you want instantly'
  ];
  List<String> content = [
    'You can read thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
    'You can write thousands of articles on Blog Club, save them in the application and share them with your loved ones.',
    'You can like thousands of articles on Blog Club, save them in the application and share them with your loved ones.'
  ];

  Widget _buildPage(int index) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            title[index],
            style: TextStyle(
              height: 1.5,
              color: Theme.of(context).textTheme.headline1!.color,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Text(
            content[index],
            style: TextStyle(
              height: 1.5,
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
