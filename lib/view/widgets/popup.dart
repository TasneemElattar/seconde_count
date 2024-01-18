import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seconds_count/utils/text_style.dart';

class PopupContent extends StatelessWidget {
  final Stream<int> secondsStream;
  String hint;
  PopupContent({super.key, required this.secondsStream,this.hint=''});

  @override
  Widget build(BuildContext context) {
    return
      StreamBuilder<int>(
      stream: secondsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(hint,style: boldTextStyle(),),
              Text('${snapshot.data}',style: primaryTextStyle(),),
            ],
          );
        } else {
          return Container(); // Handle initial loading state
        }
      },
    );
  }
}
