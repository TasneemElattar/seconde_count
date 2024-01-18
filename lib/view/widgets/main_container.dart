import 'package:flutter/material.dart';
import 'package:seconds_count/utils/color.dart';

class MainContainer extends StatelessWidget {
  Widget child;
  Color background;
  Color borderColor;
  double radius;
   MainContainer({required this.child,this.background = backgroundColor,this.radius = 20,this.borderColor = primaryColor,super.key});

  @override
  Widget build(BuildContext context) {
   final double height=MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height:height *.88,
      decoration: BoxDecoration(
          color: background,
          borderRadius:  BorderRadius.all(Radius.circular(radius)),
        border: Border.all(
          color: borderColor, // Border color
          width: 4.5, // Border width
        ),



      ),
      child: child,


    );
  }
}
