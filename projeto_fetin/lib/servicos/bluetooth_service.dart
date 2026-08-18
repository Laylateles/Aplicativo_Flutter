import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothServiceKeepClose {

  static final Guid serviceUuid = Guid(
    "12345678-1234-1234-1234-123456789001",
  );

  Future<void> iniciarBusca() async {

    if (await FlutterBluePlus.isSupported == false) {
      print("Bluetooth não suportado");
      return;
    }

    await FlutterBluePlus.startScan(
      withServices: [serviceUuid],
      timeout: const Duration(seconds: 10),
    );
  }
}