import 'package:flutter/material.dart';
import 'package:untitled1/res/app_colors/app_colors.dart';

Widget TextWidget(
  String text,
  BuildContext context,
  double width,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
    child: Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold),
    ),
  );
}
