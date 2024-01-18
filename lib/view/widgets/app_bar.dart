import 'package:flutter/material.dart';
import 'package:seconds_count/utils/color.dart';

Widget appBar({
  double? height = 135,
  double width = double.infinity,
  Color? color = primaryColor,
    double radius = 25
}) {
  return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius:  BorderRadius.only(bottomLeft: Radius.circular(radius),bottomRight: Radius.circular(radius))


      ),
  );
}
