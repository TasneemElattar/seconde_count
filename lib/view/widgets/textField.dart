import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/text_style.dart';

class AppTextFiled extends StatelessWidget {
  TextEditingController controller;
  String title;
  Color borderColor;
  Function? onchange;
  AppTextFiled(
      {this.onchange,
      required this.title,
      this.borderColor = textFieldColor,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: height * .06,
            child: Text(
              title,
              style: primaryTextStyle(),
            )),
        TextField(
            onChanged: (_) {
              onchange!();
            },
            controller: controller,
            keyboardType: TextInputType.number,
            cursorColor: borderColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
              ),
            )),
      ],
    );
  }
}
