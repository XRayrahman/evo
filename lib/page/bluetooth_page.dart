import 'package:evo/bluetooth_controller.dart';
import 'package:evo/main_controller.dart';
import 'package:evo/widget/list_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothPage extends StatelessWidget {
  const BluetoothPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
    MainController c = MainController();
    BluetoothController b = BluetoothController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bluetooth"),
        backgroundColor: c.navyActive,
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView(
        children: [
          const Divider(),
          ListCard(
            title: "Bluetooth Status",
            subtitleStyle: const TextStyle(),
            subtitle: b.bluetoothStatus.value,
            // childs: Obx(
            //   () => Switch(
            //       value: b.bluetoothStatus.value, onChanged: b.onSwitch()),
            // ),
            childs: Switch(
              value: _bluetoothState.isEnabled,
              onChanged: (bool value) {
                b.future(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
