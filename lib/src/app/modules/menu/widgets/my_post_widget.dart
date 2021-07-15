import 'package:flutter/material.dart';
import 'package:flutter_getx_pattern/src/app/modules/menu/widgets/my_post_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPostWidget extends StatefulWidget {
  MyPostWidget({Key? key}) : super(key: key);

  @override
  _MyPostWidgetState createState() => _MyPostWidgetState();
}

class _MyPostWidgetState extends State<MyPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'My Posts',
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).textTheme.headline1!.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Icon(
                      Icons.grid_view,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Icon(
                      Icons.toc,
                      color: Color(0xFF7B8BB2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
              width: double.infinity,
              height: 170 * 10,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return MyPostWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
