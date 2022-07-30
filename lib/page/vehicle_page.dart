import 'package:evo/widget/neu_card.dart';
import 'package:evo/widget/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:evo/main_controller.dart';
import 'package:get/get.dart';

class VehiclePage extends StatelessWidget {
  const VehiclePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainController c = Get.find();
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
                  onPressed: () {},
                  icon: const Icon(LineIcons.angleLeft),
                  iconSize: 20,
                ),
                title: "Vehicle",
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
                    padding: EdgeInsets.all(20),
                    child: Text("ini vehicle information"),
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
