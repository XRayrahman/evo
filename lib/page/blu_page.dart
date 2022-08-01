import 'dart:async';

import 'package:evo/main_controller.dart';
import 'package:evo/widget/neu_card.dart';
import 'package:get/get.dart';
// import 'package:evo/bluetooth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'BackgroundCollectingTask.dart';
import 'discovery_page.dart';
import 'SelectBondedDevicePage.dart';
import 'ChatPage.dart';
import 'package:evo/widget/list_card.dart';
import 'package:evo/widget/app_bar.dart';
import 'package:line_icons/line_icons.dart';
// import './helpers/LineChart.dart';

class BluPage extends StatefulWidget {
  const BluPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BluPage createState() => _BluPage();
}

class _BluPage extends State<BluPage> {
  BluetoothState _bluetoothState = BluetoothState.UNKNOWN;

  String _address = "...";
  String _name = "...";

  Timer? _discoverableTimeoutTimer;
  int _discoverableTimeoutSecondsLeft = 0;

  BackgroundCollectingTask? _collectingTask;

  bool _autoAcceptPairingRequests = false;

  @override
  void initState() {
    super.initState();

    // Get current state
    FlutterBluetoothSerial.instance.state.then((state) {
      setState(() {
        _bluetoothState = state;
      });
    });

    Future.doWhile(() async {
      // Wait if adapter not enabled
      if ((await FlutterBluetoothSerial.instance.isEnabled) ?? false) {
        return false;
      }
      await Future.delayed(const Duration(milliseconds: 0xDD));
      return true;
    }).then((_) {
      // Update the address field
      FlutterBluetoothSerial.instance.address.then((address) {
        setState(() {
          _address = address!;
        });
      });
    });

    FlutterBluetoothSerial.instance.name.then((name) {
      setState(() {
        _name = name!;
      });
    });

    // Listen for futher state changes
    FlutterBluetoothSerial.instance
        .onStateChanged()
        .listen((BluetoothState state) {
      setState(() {
        _bluetoothState = state;

        // Discoverable mode is disabled when Bluetooth gets disabled
        _discoverableTimeoutTimer = null;
        _discoverableTimeoutSecondsLeft = 0;
      });
    });
  }

  @override
  void dispose() {
    FlutterBluetoothSerial.instance.setPairingRequestHandler(null);
    _collectingTask?.dispose();
    _discoverableTimeoutTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MainController c = MainController();
    // BluetoothController b = BluetoothController();
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: AppBarCard(
                title: "Bluetooth",
                iconRight: IconButton(
                  onPressed: () {
                    c.goToPage("Settings");
                  },
                  icon: const Icon(LineIcons.cog),
                  iconSize: 24,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                children: <Widget>[
                  const Divider(),
                  ListCard(
                    title: "Bluetooth Status",
                    subtitleStyle: const TextStyle(),
                    subtitle: _bluetoothState.toString(),
                    // childs: Obx(
                    //   () => Switch(
                    //       value: b.bluetoothStatus.value, onChanged: b.onSwitch()),
                    // ),
                    childs: Row(
                      children: [
                        ElevatedButton(
                          child: const Text('Settings'),
                          onPressed: () {
                            FlutterBluetoothSerial.instance.openSettings();
                          },
                        ),
                        const SizedBox(width: 10),
                        Switch(
                          value: _bluetoothState.isEnabled,
                          onChanged: (bool value) {
                            // Do the request and update with the true value then
                            future() async {
                              // async lambda seems to not working
                              if (value) {
                                await FlutterBluetoothSerial.instance
                                    .requestEnable();
                              } else {
                                await FlutterBluetoothSerial.instance
                                    .requestDisable();
                              }
                            }

                            future().then((_) {
                              setState(() {});
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  ListCard(
                    title: "Local Adapter",
                    subtitle: "Bluetooth Information",
                    subtitleStyle: const TextStyle(),
                    childs: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Address : $_address"),
                        Text("Name : $_name"),
                      ],
                    ),
                  ),
                  ListCard(
                    title: _discoverableTimeoutSecondsLeft == 0
                        ? "Discoverable"
                        : "Discoverable for ${_discoverableTimeoutSecondsLeft}s",
                    subtitle: "EVOLION",
                    subtitleStyle: const TextStyle(),
                    childs: Row(
                      children: [
                        Checkbox(
                          value: _discoverableTimeoutSecondsLeft != 0,
                          onChanged: null,
                        ),
                        const IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.refresh),
                          onPressed: () async {
                            print('Discoverable requested');
                            final int timeout = (await FlutterBluetoothSerial
                                .instance
                                .requestDiscoverable(60))!;
                            if (timeout < 0) {
                              print('Discoverable mode denied');
                            } else {
                              print(
                                  'Discoverable mode acquired for $timeout seconds');
                            }
                            setState(() {
                              _discoverableTimeoutTimer?.cancel();
                              _discoverableTimeoutSecondsLeft = timeout;
                              _discoverableTimeoutTimer = Timer.periodic(
                                  const Duration(seconds: 1), (Timer timer) {
                                setState(() {
                                  if (_discoverableTimeoutSecondsLeft < 0) {
                                    FlutterBluetoothSerial
                                        .instance.isDiscoverable
                                        .then((isDiscoverable) {
                                      if (isDiscoverable ?? false) {
                                        print(
                                            "Discoverable after timeout... might be infinity timeout :F");
                                        _discoverableTimeoutSecondsLeft += 1;
                                      }
                                    });
                                    timer.cancel();
                                    _discoverableTimeoutSecondsLeft = 0;
                                  } else {
                                    _discoverableTimeoutSecondsLeft -= 1;
                                  }
                                });
                              });
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  ListCard(
                    title: "Specific pin for Pairing",
                    subtitle: "Pin 1234",
                    childs: Switch(
                      value: _autoAcceptPairingRequests,
                      onChanged: (bool value) {
                        setState(
                          () {
                            _autoAcceptPairingRequests = value;
                          },
                        );
                        if (value) {
                          FlutterBluetoothSerial.instance
                              .setPairingRequestHandler(
                                  (BluetoothPairingRequest request) {
                            print("Trying to auto-pair with Pin 1234");
                            if (request.pairingVariant == PairingVariant.Pin) {
                              return Future.value("1234");
                            }
                            return Future.value(null);
                          });
                        } else {
                          FlutterBluetoothSerial.instance
                              .setPairingRequestHandler(null);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            // behavior: ,
                            onTap: () => Get.to(DiscoveryPage()),
                            child: NeuCard(
                              childs: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: const [
                                    Expanded(
                                        child: FittedBox(
                                            child: Icon(LineIcons.search))),
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
                            child: NeuCard(
                              childs: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: const [
                                    Expanded(
                                        child: FittedBox(
                                            child:
                                                Icon(LineIcons.commentDots))),
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
                  ),
                  ListTile(
                    title: ElevatedButton(
                        child: const Text('Explore discovered devices'),
                        onPressed: () async {
                          final BluetoothDevice? selectedDevice =
                              await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const DiscoveryPage();
                              },
                            ),
                          );

                          if (selectedDevice != null) {
                            print('Discovery -> selected ' +
                                selectedDevice.address);
                          } else {
                            print('Discovery -> no device selected');
                          }
                        }),
                  ),
                  ListTile(
                    title: ElevatedButton(
                      child: const Text('Connect to paired device to chat'),
                      onPressed: () async {
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
                          print(
                              'Connect -> selected ' + selectedDevice.address);
                          _startChat(context, selectedDevice);
                        } else {
                          print('Connect -> no device selected');
                        }
                      },
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

  void _startChat(BuildContext context, BluetoothDevice server) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ChatPage(server: server);
        },
      ),
    );
  }
}
