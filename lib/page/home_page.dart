import 'package:evo/status_controller.dart';
import 'package:evo/widget/app_bar.dart';
import 'package:evo/widget/battery.dart';
import 'package:evo/widget/list_card.dart';
import 'package:evo/widget/status_card.dart';
import 'package:evo/widget/status_mini_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:evo/main_controller.dart';
import 'package:get/get.dart';
import 'package:evo/widget/neu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController c = Get.find();
    final StatusController s = Get.put(StatusController());
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppBarCard(
                title: "Home",
                iconRight: IconButton(
                  onPressed: () {
                    c.goToPage("Settings");
                  },
                  icon: const Icon(LineIcons.cog),
                  iconSize: 24,
                ),
              ),
              Expanded(
                  child: NeuCard(
                childs: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => s.onPressed(70),
                          // color: Colors.amber,
                          // padding: EdgeInsets.all(10),
                          child: StatusCard(
                            title: "Battery",
                            childs: Column(
                              children: [
                                Container(
                                    alignment: Alignment.centerLeft,
                                    // padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                                    child: Obx(
                                      () => Text(
                                        "${s.batteryValue.value}%",
                                        style: const TextStyle(fontSize: 50),
                                      ),
                                    )),
                                const BatteryWidget(
                                  value: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment: ,
                          children: const [
                            Expanded(
                              child: StatusMiniCard(
                                title: "°C",
                                childs: Text(
                                  "34",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                            Expanded(
                              child: StatusMiniCard(
                                title: "V ",
                                childs: Text(
                                  "74",
                                  style: TextStyle(fontSize: 40),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
              ListCard(
                title: "Bluetooth",
                subtitle: "connect with dashboard",
                subtitleStyle: const TextStyle(),
                childs: Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(LineIcons.bluetooth),
                  )
                ]),
              ),
              ListCard(
                title: "Navigation",
                subtitle: "estimate travel time and lineage",
                subtitleStyle: const TextStyle(),
                childs: IconButton(
                    onPressed: () {
                      c.goToPage("Navigation");
                    },
                    icon: const Icon(LineIcons.locationArrow)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
