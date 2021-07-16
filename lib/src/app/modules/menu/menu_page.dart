import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/routes/app_pages.dart';
import 'package:get/get.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
  }

  var top = 0.0;

  Widget _buildListTileMenu({String? title, IconData? icon, int? tabIndex}) {
    return ListTile(
      title: Text(
        title ?? '',
        style: TextStyle(
          color: Theme.of(context).textTheme.headline1!.color,
        ),
      ),
      leading: Icon(
        icon ?? null,
        color: Theme.of(context).textTheme.headline1!.color,
      ),
      onTap: () {
        Get.toNamed(Routes.PROFILE, arguments: [
          {'tabIndex': tabIndex}
        ]);
      },
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: true,
              elevation: 4,
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          AnimatedOpacity(
                            opacity: top <= 110.0 ? 1 : 0,
                            duration: Duration(milliseconds: 300),
                            child: Row(
                              children: <Widget>[
                                SizedBox(width: 12),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white, blurRadius: 1)
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          'assets/images/imageTitle1.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12),
                                Text("Tuong",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: AssetImage('assets/images/imageStories.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildListTileMenu(
                      title: 'Profile', icon: Icons.person, tabIndex: 0)
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
