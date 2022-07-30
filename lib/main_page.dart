import 'package:evo/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MainController c = Get.put(MainController());

    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => Center(
            child: c.widgetOptions.elementAt(c.selectedIndex.value),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[300],
          child: const NavBar(),
        ));
  }
}
