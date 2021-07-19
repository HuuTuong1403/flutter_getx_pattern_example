import 'package:flutter/material.dart';

class SearchByHeader extends SliverPersistentHeaderDelegate {
  final double flexibleSpace;
  final double backGroundHeight;
  final double stackPaddingTop;
  final double titlePaddingTop;
  final Widget title;
  final Widget? subTitle;
  final Widget? leading;
  final Widget? action;
  final Widget stackChild;

  SearchByHeader(
      {this.flexibleSpace = 300,
      this.backGroundHeight = 200,
      required this.stackPaddingTop,
      this.titlePaddingTop = 15,
      required this.title,
      this.subTitle,
      this.leading,
      this.action,
      required this.stackChild});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var percent = shrinkOffset / (maxExtent - minExtent);
    double calculate = 1 - percent < 0 ? 0 : (1 - percent);
    return SizedBox(
      height: maxExtent,
      child: Stack(
        children: <Widget>[
          Container(
            height: minExtent + ((backGroundHeight - minExtent) * calculate),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.pink,
                ],
                begin: const FractionalOffset(0, 1),
                end: const FractionalOffset(1, 0),
                stops: [0, 1],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.35,
            top: titlePaddingTop * calculate + 27,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: MediaQuery.of(context).size.width,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    leading ?? SizedBox(),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Transform.scale(
                            alignment: Alignment.centerLeft,
                            scale: 1 + (calculate * .5),
                            child: Padding(
                              padding:
                                  EdgeInsets.only(top: 14 * (1 - calculate)),
                              child: title,
                            ),
                          ),
                          if (calculate > .5) ...[
                            SizedBox(height: 10),
                            Opacity(
                              opacity: calculate,
                              child: subTitle ?? SizedBox(),
                            ),
                          ],
                        ]),
                  ]),
            ),
          ),
          Positioned(
            top: minExtent + ((stackPaddingTop - minExtent) * calculate),
            child: Opacity(
              opacity: calculate,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: stackChild,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => flexibleSpace;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
