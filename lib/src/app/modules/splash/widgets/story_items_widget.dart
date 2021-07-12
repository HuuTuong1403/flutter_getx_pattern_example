import 'package:flutter/material.dart';

class StoryItemsWidget extends StatefulWidget {
  StoryItemsWidget({Key? key}) : super(key: key);

  @override
  _StoryItemsWidgetState createState() => _StoryItemsWidgetState();
}

class _StoryItemsWidgetState extends State<StoryItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(colors: [
                    Color(0xFF9CECFB),
                    Color(0xFF49B0E2),
                    Color(0xFF376AED),
                  ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
                ),
              ),
              Positioned(
                top: 6,
                left: 17,
                child: Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              Positioned(
                top: 15,
                left: 25,
                child: Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('assets/images/imageTitle1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF4DC4E7),
                    radius: 24,
                    child: Icon(Icons.video_call, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'Emila',
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).textTheme.bodyText1!.color,
            ),
          ),
        ],
      ),
    );
  }
}
