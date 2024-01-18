import 'package:flutter/material.dart';
import 'package:seconds_count/utils/color.dart';

Widget resultBox({
  required Widget child,
  Color backGround = resultBoxColor,
  double radius = 110
}) {
  return CircleAvatar(
    backgroundColor: backGround,
    radius: radius,
    child: child,




  );
}
