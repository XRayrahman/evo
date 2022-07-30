import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:get/get.dart';
import 'main_controller.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController c = Get.find();

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4, 4),
            blurRadius: 15,
            spreadRadius: 0.7,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 15,
            spreadRadius: 0.7,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
        child: Obx(
          () => GNav(
            gap: 12,
            color: Colors.grey[600],
            activeColor: Colors.white,
            rippleColor: Colors.grey[800]!,
            hoverColor: Colors.grey[700]!,
            iconSize: 20,
            textStyle: const TextStyle(fontSize: 16, color: Colors.white),
            tabBackgroundColor: c.navyActive,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            duration: const Duration(milliseconds: 300),
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: LineIcons.locationArrow,
                text: 'Navigation',
              ),
              GButton(
                icon: LineIcons.motorcycle,
                text: 'Vehicle',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Settings',
              ),
            ],
            selectedIndex: c.selectedIndex.value,
            onTabChange: c.onTabChanged,
          ),
        ),
      ),
    );
  }
}
