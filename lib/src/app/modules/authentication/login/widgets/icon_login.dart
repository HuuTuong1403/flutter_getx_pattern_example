import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildIcon(
    {required BuildContext context,
    required String iconSvg,
    required Function fct}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: Theme.of(context).backgroundColor,
      onTap: () {
        fct();
      },
      child: SvgPicture.asset(iconSvg),
    ),
  );
}
