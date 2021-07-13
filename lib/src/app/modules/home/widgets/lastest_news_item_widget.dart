import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LastestNewsItemWidget extends StatefulWidget {
  LastestNewsItemWidget({Key? key}) : super(key: key);

  @override
  _LastestNewsItemWidgetState createState() => _LastestNewsItemWidgetState();
}

class _LastestNewsItemWidgetState extends State<LastestNewsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 300,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 5,
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage('assets/images/imageTitle3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BIG DATA',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Why Big Data Needs Thick Data?',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).textTheme.headline1!.color,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.thumbsUp,
                              size: 18,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color),
                          const SizedBox(width: 5),
                          Text(
                            '2.1k',
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(FontAwesomeIcons.clock,
                              size: 18,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color),
                          const SizedBox(width: 5),
                          Text(
                            '1hr ago',
                            style: TextStyle(
                              fontSize: 14,
                              color:
                                  Theme.of(context).textTheme.bodyText1!.color,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.bookmark_rounded,
                          size: 18,
                          color: Theme.of(context).textTheme.bodyText1!.color),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
