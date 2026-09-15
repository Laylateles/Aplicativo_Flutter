import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class BluetoothServiceKeepClose {
  static final BluetoothServiceKeepClose instancia =
      BluetoothServiceKeepClose._();

  BluetoothServiceKeepClose._();

  final Map<String, BluetoothDevice> dispositivosConectados = {};

  // UUID do serviço BLE da tag KeepClose
  final Guid serviceUuid = Guid("12345678-1234-1234-1234-123456789001");

  Stream<List<ScanResult>> get resultadosScan => FlutterBluePlus.scanResults;

  Future<void> iniciarBusca() async {
    print("TESTE 1: iniciarBusca foi chamado");

    final suportado = await FlutterBluePlus.isSupported;

    print("TESTE 2: Bluetooth suportado = $suportado");

    if (!suportado) {
      throw Exception("Bluetooth não suportado");
    }

    await FlutterBluePlus.stopScan();

    print("TESTE 3: iniciando scan");

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 10));

    print("TESTE 4: startScan executado");
  }

  Future<void> pararBusca() async {
    await FlutterBluePlus.stopScan();
  }

  Future<void> conectar(BluetoothDevice device) async {
    if (!device.isConnected) {
      await device.connect(
        license: License.nonprofit,
        timeout: const Duration(seconds: 10),
      );
    }

    dispositivosConectados[device.remoteId.str] = device;
  }

  Future<int?> lerRssiPorId(String idBluetooth) async {
    final device = dispositivosConectados[idBluetooth];

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

  Stream<bool>? monitorarConexaoPorId(String idBluetooth) {
    final device = dispositivosConectados[idBluetooth];

    if (device == null) {
      return null;
    }

    return device.connectionState.map(
      (estado) => estado == BluetoothConnectionState.connected,
    );
  }
}
