import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StatusController extends GetxController {
  var batteryValue = 0.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  Color navy = const Color.fromARGB(255, 6, 17, 21);
  Color navyActive = const Color.fromARGB(255, 23, 33, 36);

  onPressed(int args) {
    while (batteryValue.value < args) {
      batteryValue.value++;
    }
    update();
  }
}
