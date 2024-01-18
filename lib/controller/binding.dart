import 'package:get/get.dart';
import 'package:seconds_count/controller/seconds_count_controller.dart';

class MyBinding implements  Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SecondsCountController(),fenix: true);
  }

}