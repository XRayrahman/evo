import 'package:evo/page/blu_page.dart';
import 'package:evo/page/bluetooth_page.dart';
import 'package:evo/page/navigation_page.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: AppBarCard(
                title: "Home",
                iconRight: IconButton(
                  onPressed: () {
                    c.goToPage("Settings");
                  },
                  icon: const Icon(LineIcons.cog),
                  iconSize: 24,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              height: 320,
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
                            iconRight: LineIcons.plug,
                            childs: Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: FittedBox(
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 0, 0, 2),
                                        child: Obx(
                                          () => Text(
                                            "${s.batterySocVal.value}%",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => RotatedBox(
                                      quarterTurns: 3,
                                      child: BatteryWidget(
                                        value: s.batterySocVal.value.toDouble(),
                                        size: 110,
                                        // size: MediaQuery.of(context)
                                        //     .size
                                        //     .height,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment: ,
                          children: [
                            const Expanded(
                              child: StatusMiniCard(
                                title: "34 °C",
                                subtitle: Text(
                                  "Temperature",
                                  style: TextStyle(fontSize: 16),
                                ),
                                iconRight: LineIcons.thermometerAlt4Full,
                              ),
                            ),
                            Expanded(
                              child: Obx(
                                () => StatusMiniCard(
                                  subtitle: const Text(
                                    "Voltage",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  title: "${s.batteryVoltVal.value.toInt()} V ",
                                  iconRight: LineIcons.lightningBolt,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(),
                  ),
                  GestureDetector(
                    onTap: () => c.goToPage("Bluetooth"),
                    child: ListCard(
                      title: "Bluetooth",
                      subtitle: "connect with dashboard",
                      subtitleStyle: const TextStyle(),
                      childs: Row(children: [
                        IconButton(
                          onPressed: () {
                            c.goToPage("Bluetooth");
                          },
                          icon: const Icon(LineIcons.bluetooth),
                        )
                      ]),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(),
                  ),
                  GestureDetector(
                    onTap: () => c.goToPage("Navigation"),
                    child: ListCard(
                      title: "Navigation",
                      subtitle: "estimate travel time and lineage",
                      subtitleStyle: const TextStyle(),
                      childs: IconButton(
                          onPressed: () {
                            c.goToPage("Navigation");
                          },
                          icon: const Icon(LineIcons.locationArrow)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Divider(),
                  ),
                  GestureDetector(
                    onTap: () => c.goToPage("Settings"),
                    child: ListCard(
                      title: "Settings",
                      subtitle: "Edit Account and Preferences",
                      subtitleStyle: const TextStyle(),
                      childs: IconButton(
                          onPressed: () {
                            c.goToPage("Settings");
                          },
                          icon: const Icon(LineIcons.cog)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
