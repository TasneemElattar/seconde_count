import 'dart:async';
import 'package:get/get.dart';


class SecondsCountController extends GetxController{
  int seconds = 0;
  Timer? time;

  final _secondsController = StreamController<int>.broadcast();
  Stream<int> get secondsStream => _secondsController.stream;
    countSeconds(int s){
      seconds = s;

      time = Timer.periodic(const Duration(seconds: 1), (time) {
      if (seconds > 0) {
       seconds--;
        _secondsController.add(seconds);
        update();

      } else {
        Get.find<SecondsCountController>().stopTimer();

        return;
      }
    });

  }
  void stopTimer(){
  time?.cancel();
  update();


}
  @override
  void onClose() {
    _secondsController.close();
    super.onClose();
  }

}