import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothServiceKeepClose {
  final Map<String, BluetoothDevice> dispositivosConectados = {};

  static final BluetoothServiceKeepClose instancia =
      BluetoothServiceKeepClose._();

  BluetoothServiceKeepClose._();

  final Guid serviceUuid = Guid(
    "12345678-1234-1234-1234-123456789001",
  );

  final Guid buzzerUuid = Guid(
    "12345678-1234-1234-1234-123456789002",
  );

  Stream<List<ScanResult>> get resultadosScan =>
      FlutterBluePlus.scanResults;

  Future<void> iniciarBusca() async {
    final suportado = await FlutterBluePlus.isSupported;

    if (!suportado) {
      throw Exception("Bluetooth não suportado");
    }

    await FlutterBluePlus.stopScan();

    await FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 10),
    );
  }

  Future<void> pararBusca() async {
    await FlutterBluePlus.stopScan();
  }


  Future<void> conectar(BluetoothDevice device) async {
    await device.connect( 
      license: License.nonprofit,
    );

    dispositivosConectados[device.remoteId.str] = device;
  }

  Future<int> lerRssi(BluetoothDevice device) async {
    return device.readRssi();
  }

  BluetoothDevice? buscarDispositivo(String idBluetooth,) {
     return dispositivosConectados[idBluetooth];
  }


  Future<void> acionarBuzzerPorId(String idBluetooth,bool ligar,) async {
    final device = dispositivosConectados[idBluetooth];
    if (device == null) {
      return;
    }
    await acionarBuzzer(
      device,
      ligar,
    );
  }

  Future<int?> lerRssiPorId(String idBluetooth,) async {
    final device = dispositivosConectados[idBluetooth];

    if (device == null) {
      return null;
    }

    if (!device.isConnected) {
      return null;
    }

    return await lerRssi(device);
  }

  Future<void> acionarBuzzer(BluetoothDevice device,bool ligar,) async {
    final services = await device.discoverServices();

    for (final service in services) {
      if (service.uuid == serviceUuid) {
        for (final characteristic in service.characteristics) {
          if (characteristic.uuid == buzzerUuid) {
            await characteristic.write(
              [ligar ? 1 : 0],
            );
            return;
          }
        }
      }
    }
  }

}