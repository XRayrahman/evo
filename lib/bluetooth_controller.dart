import 'package:get/get.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothController extends GetxController {
  // BluetoothState _bluetoothState = BluetoothState.UNKNOWN;
  var bluetoothStatus = "Dashboard is not Connected".obs;

  // statusBluetooth(){
  //   _bluetoothState.isEnabled?
  // }

  future(val) async {
    if (val) {
      await FlutterBluetoothSerial.instance.requestEnable();
    } else {
      await FlutterBluetoothSerial.instance.requestDisable();
    }
  }
}
