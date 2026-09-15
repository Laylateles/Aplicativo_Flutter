import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothServiceKeepClose {
  static final BluetoothServiceKeepClose instancia =
      BluetoothServiceKeepClose._();

  BluetoothServiceKeepClose._();

  final Map<String, BluetoothDevice> dispositivosConectados = {};

  // UUID do serviço BLE da tag KeepClose
  final Guid serviceUuid = Guid(
    "12345678-1234-1234-1234-123456789001",
  );

  Stream<List<ScanResult>> get resultadosScan =>
      FlutterBluePlus.scanResults;

  /*Future<void> iniciarBusca() async {
    final suportado = await FlutterBluePlus.isSupported;

    if (!suportado) {
      throw Exception("Bluetooth não suportado");
    }

    await FlutterBluePlus.stopScan();

    await FlutterBluePlus.startScan(
      // Ainda mantemos o filtro comentado,
      // porque com ele o ESP32 não estava aparecendo.
      // withServices: [serviceUuid],
      timeout: const Duration(seconds: 10),
    );
  }*/

Future<void> iniciarBusca() async {
  final suportado = await FlutterBluePlus.isSupported;

  if (!suportado) {
    throw Exception("Bluetooth não suportado neste celular");
  }

  final estado = FlutterBluePlus.adapterStateNow;

  if (estado != BluetoothAdapterState.on) {
    throw Exception("Bluetooth desligado");
  }

  await FlutterBluePlus.stopScan();

  await FlutterBluePlus.startScan(
    // Mantemos sem withServices por enquanto.
    timeout: const Duration(seconds: 10),
  );
}

  Future<void> pararBusca() async {
    await FlutterBluePlus.stopScan();
  }

  Future<void> conectar(
    BluetoothDevice device,
  ) async {
    if (!device.isConnected) {
      await device.connect(
        license: License.nonprofit,
        timeout: const Duration(seconds: 10),
      );
    }

    dispositivosConectados[device.remoteId.str] =
        device;
  }

  Future<int?> lerRssiPorId(
    String idBluetooth,
  ) async {
    final device =
        dispositivosConectados[idBluetooth];

    if (device == null || !device.isConnected) {
      return null;
    }

    try {
      return await device.readRssi();
    } catch (erro) {
      print("Erro ao ler RSSI: $erro");
      return null;
    }
  }

  Stream<bool>? monitorarConexaoPorId( String idBluetooth,) {
    final device =
        dispositivosConectados[idBluetooth];

    if (device == null) {
      return null;
    }

    return device.connectionState.map(
      (estado) => estado == BluetoothConnectionState.connected,
    );
  }
}