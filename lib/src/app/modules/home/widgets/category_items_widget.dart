import 'package:flutter/material.dart';

class CategoryItemsWidget extends StatefulWidget {
  CategoryItemsWidget({Key? key}) : super(key: key);

  @override
  _CategoryItemsWidgetState createState() => _CategoryItemsWidgetState();
}

class _CategoryItemsWidgetState extends State<CategoryItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: DecorationImage(
              image: AssetImage('assets/images/imageTitle2.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(28),
                bottomRight: Radius.circular(28),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.36),
                  blurRadius: 15,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 25,
          child: Text(
            'Technology',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
