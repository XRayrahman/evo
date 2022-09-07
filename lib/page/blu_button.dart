import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:evo/widget/neu_card.dart';
import 'discovery_page.dart';
import 'ChatPage.dart';
import 'package:line_icons/line_icons.dart';
import 'SelectBondedDevicePage.dart';

class BlueButton extends StatelessWidget {
  const BlueButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () async {
                final BluetoothDevice? selectedDevice =
                    await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const DiscoveryPage();
                    },
                  ),
                );

                if (selectedDevice != null) {
                  print('Discovery -> selected ${selectedDevice.address}');
                } else {
                  print('Discovery -> no device selected');
                }
              },
              child: NeuCard(
                childs: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: const [
                      Expanded(child: FittedBox(child: Icon(LineIcons.search))),
                      Text(
                        "Discover",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final BluetoothDevice? selectedDevice =
                    await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SelectBondedDevicePage(
                          checkAvailability: false);
                    },
                  ),
                );

                if (selectedDevice != null) {
                  print('Connect -> selected ${selectedDevice.address}');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return ChatPage(server: selectedDevice);
                      },
                    ),
                  );
                } else {
                  print('Connect -> no device selected');
                }
              },
              child: NeuCard(
                childs: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: const [
                      Expanded(
                          child: FittedBox(child: Icon(LineIcons.commentDots))),
                      Text(
                        "Chat",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
