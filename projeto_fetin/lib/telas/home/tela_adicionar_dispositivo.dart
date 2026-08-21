import 'package:flutter/material.dart';
import 'tela_nomear_dispositivo.dart';
import '../modelo/dispositivo_modelo.dart';
import 'package:projeto_fetin/tema/app_cores.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import '../../servicos/bluetooth_service.dart';

class TelaAdicionarDispositivo extends StatefulWidget {
  final List<String> idsCadastrados;

  const TelaAdicionarDispositivo({
    super.key,
    required this.idsCadastrados, //oi layla tudo bem
  });

  @override
  State<TelaAdicionarDispositivo> createState() => _TelaAdicionarDispositivoState();
}

class _TelaAdicionarDispositivoState extends State<TelaAdicionarDispositivo> {

  final BluetoothServiceKeepClose bluetooth = BluetoothServiceKeepClose.instancia;

  @override
  void initState() {
    super.initState();
    bluetooth.iniciarBusca();
  }

  @override
  void dispose() {
    bluetooth.pararBusca();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.location_on,
                    color: AppCores.roxoMeioTermo,
                    size: 38,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "KeepClose",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppCores.roxoMeioTermo,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              const Text(
                "Adicionar dispositivo",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Procure uma tag KeepClose próxima para conectá-la ao aplicativo.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: AppCores.cinza,
                ),
              ),
              const SizedBox(height: 35),

              const CircularProgressIndicator(
                color: AppCores.roxoMeioTermo,
              ),

              const SizedBox(height: 20),

              const Text(
                "Procurando tags próximas...",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 30),

                StreamBuilder<List<ScanResult>>(
                  stream: bluetooth.resultadosScan,
                  builder: (context, snapshot) {
                    final resultados = snapshot.data ?? [];

                    final disponiveis = resultados.where((resultado) {
                      final id = resultado.device.remoteId.str;

                      return !widget.idsCadastrados.contains(id);
                    }).toList();

                    if (disponiveis.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Nenhuma tag KeepClose encontrada.",
                        ),
                      );
                    }

                    return Column(
                      children: disponiveis.map((resultado) {
                        final device = resultado.device;
                        /*final nome = device.platformName.isNotEmpty
                            ? device.platformName
                            : device.remoteId.str;*/
                            final nome =
                              resultado.advertisementData.advName.isNotEmpty
                                  ? resultado.advertisementData.advName
                                  : device.remoteId.str;
                            print(
                            "Encontrado: "
                            "${resultado.advertisementData.advName} | "
                            "${resultado.device.remoteId.str} | "
                            "RSSI ${resultado.rssi}",
                          );

                        return ListTile(
                          leading: const Icon(
                            Icons.bluetooth,
                            color: AppCores.roxoMeioTermo,
                          ),
                          title: Text(nome),
                          subtitle: Text(
                            "Sinal: ${resultado.rssi} dBm",
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () async {
                            await bluetooth.pararBusca();

                            await bluetooth.conectar(device);

                            if (!context.mounted) return;

                            final dispositivo =
                                await Navigator.push<DispositivoModelo>(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    TelaNomearDispositivo(
                                  nomeBluetooth:
                                      device.remoteId.str,
                                ),
                              ),
                            );

                            if (dispositivo != null &&
                                context.mounted) {
                              Navigator.pop(
                                context,
                                dispositivo,
                              );
                            }
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}