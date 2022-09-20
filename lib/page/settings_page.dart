import 'package:evo/main_controller.dart';
import 'package:evo/widget/app_bar.dart';
import 'package:evo/widget/list_card.dart';
import 'package:evo/widget/list_info.dart';
import 'package:evo/widget/neu_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
                iconLeft: IconButton(
                  onPressed: () {
                    c.goToPage("Home");
                  },
                  icon: const Icon(LineIcons.angleLeft),
                  iconSize: 20,
                ),
                title: "Settings",
                iconRight: IconButton(
                  onPressed: () {
                    c.goToPage("Settings");
                  },
                  icon: const Icon(LineIcons.cog),
                ),
              ),
              Expanded(
                child: NeuCard(
                  childs: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView(
                      children: const [
                        NeuCard(
                          padding: EdgeInsets.all(2),
                          childs: ListInfo(
                            title: "Username",
                            subtitle: "Change your name",
                            childs: Icon(LineIcons.user),
                          ),
                        ),
                        NeuCard(
                            padding: EdgeInsets.all(2),
                            childs: ListInfo(
                              title: "Vehicle ID",
                              subtitle: "Change your vehicle ID",
                              childs: Icon(LineIcons.car),
                            )),
                        NeuCard(
                            padding: EdgeInsets.all(2),
                            childs: ListInfo(
                              title: "Dark Mode",
                              subtitle: "Change theme apps",
                              childs: Switch(value: false, onChanged: null),
                            )),
                        NeuCard(
                            padding: EdgeInsets.all(2),
                            childs: ListInfo(
                              title: "About",
                              subtitle: "System Information",
                              childs: Icon(LineIcons.infoCircle),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
