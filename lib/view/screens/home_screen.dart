import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:seconds_count/utils/color.dart';
import 'package:seconds_count/utils/text_style.dart';
import '../../controller/seconds_count_controller.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttons.dart';
import '../widgets/count_box.dart';
import '../widgets/main_container.dart';
import '../widgets/popup.dart';
import '../widgets/textField.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _secondsController = TextEditingController();



  @override
  void dispose() {
    _secondsController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final double width=MediaQuery.of(context).size.width;
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              appBar(),
              Padding(
                padding: EdgeInsets.only(top: height*.08,left: width*.1,right:width*.1, bottom: height*.03),
                child: MainContainer(
                  child: childOfMainContainer(width,height),
                ),
              ),
              Positioned(
                  left: width* -.14,
                  bottom: height* -.095,
                  child:
              resultBox(child: resultView()
              )
              )

            ],
          ),
        ),
      ),


    );
  }
  Widget childOfMainContainer(w,h){
    return Padding(
      padding:  const EdgeInsets.symmetric(vertical: 27,horizontal: 10),
      child: GetBuilder<SecondsCountController>(
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppTextFiled(title: "Enter Seconds:",controller: _secondsController,
                  onchange: (){
                controller.stopTimer();}),
              SizedBox(height: h*.027 ,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     mainButtons(
                         function:(){
                           if(_secondsController.text!=''){
                           controller.countSeconds(int.parse(_secondsController.text));
                           _secondsController.clear();
                           }

                         },
                         buttonName: "Start",width: w,height: h),
                    mainButtons(
                        function: (){
                          Get.defaultDialog(
                            title: '',

                              backgroundColor: resultBoxColor,
                              content: PopupContent(secondsStream: controller.secondsStream,hint:"Count down")
                          );

                        },buttonName: "Show Popup",height: h,width: w)
                  ],
                ),
             ] )




          ],);
        }
      ),
    );
  }
  Widget resultView(){
    return  GetBuilder<SecondsCountController>(
        init: SecondsCountController(),
        builder: (controller) {
        return Padding(
          padding:  const EdgeInsets.only(left: 30,top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Count down",style: primaryTextStyle(),),
              Text('${controller.seconds}',style: boldTextStyle(size: 25),)



    ],
    )


        );
      }
    );
  }

}
