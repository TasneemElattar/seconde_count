import 'package:flutter/material.dart';
import 'package:seconds_count/utils/text_style.dart';

import '../../utils/color.dart';


Widget mainButtons({
  required double width,
  required double height,
  required  Function() function,


  required String buttonName,
  Color color = buttonsColor,


}){
  return
    GestureDetector(
      onTap: function,
      child: Container(
       width: width*.3,
        height: height*.06,
        margin: EdgeInsets.symmetric(vertical: height*.01),
        decoration: BoxDecoration(
          color: buttonsColor,
          border: Border.all(
             color: color,
          ),

         borderRadius: const BorderRadius.all(Radius.circular(15))), // Adjust the radius of the overall border

       child: Center(child: Text(buttonName,style: primaryTextStyle(),)),
      ),
    );

}