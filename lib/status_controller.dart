import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StatusController extends GetxController {
  var batterySocVal = 0.obs;
  var batteryVoltVal = 0.00.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  Color navy = const Color.fromARGB(255, 6, 17, 21);
  Color navyActive = const Color.fromARGB(255, 23, 33, 36);

  onPressed(int args) {
    // while (batteryVoltVal.value < args) {
    //   batteryVoltVal.value++;
    // }
    batteryVoltVal.value += .5;
    if (batteryVoltVal.value >= 84.0) {
      batterySocVal.value = 100;
    } else if (batteryVoltVal.value < 84.0 && batteryVoltVal.value >= 76.0) {
      batterySocVal.value =
          (100.0 - ((84.0 - batteryVoltVal.value) / 0.8)).toInt();
    } else if (batteryVoltVal.value < 76.0 && batteryVoltVal.value >= 72.0) {
      batterySocVal.value =
          (90.0 - ((76.0 - batteryVoltVal.value) / 0.067)).toInt();
    } else if (batteryVoltVal.value < 72.0 && batteryVoltVal.value >= 60.0) {
      batterySocVal.value =
          (30.0 - ((72.0 - batteryVoltVal.value) / 0.4)).toInt();
    } else {
      batterySocVal.value = 0;
    }
    update();
  }
}
