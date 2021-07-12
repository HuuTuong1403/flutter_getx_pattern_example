import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/home/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Navigationpage extends StatefulWidget {
  Navigationpage({Key? key}) : super(key: key);

  @override
  _NavigationpageState createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  int _currentIndex = 0;
  List<Map<String, dynamic>> _pages = [];

  void _selectedPage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': HomePage()},
      {'page': HomePage()},
      {'page': HomePage()},
      {'page': HomePage()},
      {'page': HomePage()},
      {'page': HomePage()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex]['page'],
      bottomNavigationBar: ConvexAppBar(
        onTap: _selectedPage,
        initialActiveIndex: _currentIndex,
        activeColor: Colors.blue,
        height: 60,
        top: -30,
        curveSize: 65,
        style: TabStyle.fixedCircle,
        backgroundColor: Colors.white,
        items: [
          TabItem(
            activeIcon: Icon(FontAwesomeIcons.home, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.home, color: Colors.blueGrey),
            title: 'Home',
          ),
          TabItem(
              activeIcon: Icon(FontAwesomeIcons.bookOpen, color: Colors.blue),
              icon: Icon(FontAwesomeIcons.bookOpen, color: Colors.blueGrey),
              title: 'Article'),
          TabItem(icon: Icon(null), title: ''),
          TabItem(
            activeIcon: Icon(FontAwesomeIcons.search, color: Colors.blue),
            icon: Icon(FontAwesomeIcons.search, color: Colors.blueGrey),
            title: 'Search',
          ),
          TabItem(
              activeIcon: Icon(Icons.menu, color: Colors.blue),
              icon: Icon(Icons.menu, color: Colors.blueGrey),
              title: 'Menu'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        hoverElevation: 10,
        splashColor: Colors.blueGrey,
        tooltip: "Search",
        elevation: 4,
        child: Icon(
          Icons.add,
          color: Color(0xFF8FE6FF),
        ),
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
      ),
    );
  }
}
