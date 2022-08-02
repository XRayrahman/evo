import 'package:evo/page/blu_page.dart';
import 'package:evo/page/home_page.dart';
import 'package:evo/page/settings_page.dart';
import 'package:evo/page/vehicle_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:evo/page/navigation_page.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const BluPage(),
    const NavigationPage(),
    // const VehiclePage(),
    const SettingsPage(),
  ];

  Color navy = const Color.fromARGB(255, 6, 17, 21);
  Color navyActive = const Color.fromARGB(255, 23, 33, 36);

  onTabChanged(int index) {
    selectedIndex.value = index;
    update();
  }

  goToPage(String page) {
    if (page == "Home") {
      selectedIndex.value = 0;
    } else if (page == "Bluetooth") {
      selectedIndex.value = 1;
    } else if (page == "Navigation") {
      selectedIndex.value = 2;
    } else if (page == "Settings") {
      selectedIndex.value = 3;
    }

    update();
  }
}
