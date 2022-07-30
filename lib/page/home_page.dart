import 'package:evo/widget/app_bar.dart';
import 'package:evo/widget/list_card.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:evo/main_controller.dart';
import 'package:get/get.dart';
import 'package:evo/widget/neu_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController c = Get.put(MainController());
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
                  padding: EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            child: Container(
                                padding: const EdgeInsets.all(20),
                                // color: Colors.amber,
                                child: const Text("Battery")),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment: ,
                          children: [
                            Expanded(
                              child: Container(
                                child: Container(
                                    padding: const EdgeInsets.all(20),
                                    // color: Colors.amber,
                                    child: const Text("Temperature")),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Container(
                                    padding: const EdgeInsets.all(20),
                                    // color: Colors.amber,
                                    child: const Text("Voltage")),
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
                subtitleStyle: TextStyle(),
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
                subtitleStyle: TextStyle(),
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
