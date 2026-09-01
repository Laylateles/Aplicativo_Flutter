import 'package:flutter/material.dart';
import 'tela_adicionar_dispositivo.dart';
import '../modelo/dispositivo_modelo.dart';
import 'package:projeto_fetin/tema/app_cores.dart';
import '../../servicos/bluetooth_service.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final List<DispositivoModelo> dispositivos = [];//guarda temporariamente os nomes adicionados
  final BluetoothServiceKeepClose bluetooth = BluetoothServiceKeepClose.instancia;

  String classificarSinal(int rssi) {
    if (rssi >= -55) {
      return "Muito próximo";
    }

    if (rssi >= -70) {
      return "Próximo";
    }

    if (rssi >= -82) {
      return "Distante";
    }

    return "Crítico";
  }

  Future<void> atualizarRssi(DispositivoModelo dispositivo,) async {
    final rssi = await bluetooth.lerRssiPorId(
      dispositivo.idBluetooth,
    );

    if (!mounted) return;

    if (rssi == null) {
      setState(() {
        dispositivo.conectado = false;
        dispositivo.rssi = null;
        dispositivo.proximidade = "Fora de alcance";
      });
      return;
    }

    setState(() {
      dispositivo.rssi = rssi;
      dispositivo.conectado = true;
      dispositivo.proximidade =
          classificarSinal(rssi);
      dispositivo.ultimaConexao = "Agora";
    });
  }
  void monitorarConexao(DispositivoModelo dispositivo,) {
    final stream = bluetooth.estadoConexaoPorId(
      dispositivo.idBluetooth,
    );

    if (stream == null) {
      return;
    }

    stream.listen((estado) {
      if (!mounted) return;

      if (estado == BluetoothConnectionState.disconnected) {
        setState(() {
          dispositivo.conectado = false;
          dispositivo.rssi = null;
          dispositivo.proximidade = "Fora de alcance";
        });
      }

      if (estado == BluetoothConnectionState.connected) {
        setState(() {
          dispositivo.conectado = true;
        });
      }
    });
  }

  Timer? timerRssi;
  void iniciarMonitoramentoRssi() {
    timerRssi = Timer.periodic(
    const Duration(seconds: 2),
      (timer) async {
        for (final dispositivo in dispositivos) {
          await atualizarRssi(dispositivo);
        }
      },
    );
  }
  @override
  void initState() {
    super.initState();
    iniciarMonitoramentoRssi();
  }

  @override
  void dispose() {
    timerRssi?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Row(
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppCores.roxoMeioTermo,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              const Text(
                "Olá!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Seus dispositivos",
                style: TextStyle(
                  fontSize: 16,
                  color: AppCores.cinza,
                ),
              ),
              const SizedBox(height: 30),

              Expanded(
                child: dispositivos.isEmpty ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.bluetooth_searching,
                              size: 80,
                              color: Colors.grey.shade400,
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              "Nenhum dispositivo adicionado",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "Toque no botão + para adicionar\nsua primeira tag.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                height: 1.4,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated( itemCount: dispositivos.length,
                        separatorBuilder: (context, index) => const SizedBox(height: 16),

                        itemBuilder: (context, index) {
                          final dispositivo = dispositivos[index];

                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),

                            decoration: BoxDecoration(
                              color: AppCores.branco,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: AppCores.berandoPreto,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),

                            child: Row(
                              children: [
                                const Icon(
                                  Icons.bluetooth_connected,
                                  size: 38,
                                  color: AppCores.roxoMeioTermo,
                                ),

                                const SizedBox(width: 15),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [
                                      Text(
                                        dispositivo.nome,
                                        style: const TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      Row(
                                        children: [

                                          Icon(
                                            dispositivo.conectado
                                                ? Icons.circle
                                                : Icons.circle_outlined,
                                            color: dispositivo.conectado
                                                ? Colors.green
                                                : Colors.red,
                                            size: 12,
                                          ),
                                          const SizedBox(width: 8),                                    
                                          Text(
                                            dispositivo.conectado
                                                ? "Conectado"
                                                : "Fora de alcance",

                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: dispositivo.conectado
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                          ),
                                        ]
                                      ),
                                      const SizedBox(height: 10),

                                      Text(
                                        "Distância: Calculando...",
                                      ),

                                      const SizedBox(height: 6),

                                      Text(
                                        "Última conexão: ${dispositivo.ultimaConexao}",
                                      ),
                                      const SizedBox(height: 6),

                                      Text(
                                        dispositivo.rssi != null
                                            ? "Sinal: ${dispositivo.rssi} dBm"
                                            : "Sinal: aguardando...",
                                      ),

                                      const SizedBox(height: 6),

                                      Text(
                                        "Proximidade: ${dispositivo.proximidade}",
                                      ),
                                    ],
                                  ),
                                ),

                                PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.more_vert,
                                    color: AppCores.cinza,
                                  ),

                                  onSelected: (valor) {
                                    if (valor == "renomear") {
                                    final controller = TextEditingController(
                                      text: dispositivo.nome,
                                    );

                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text("Renomear dispositivo"),

                                          content: TextField(
                                            controller: controller,
                                            decoration: const InputDecoration(
                                              labelText: "Novo nome",
                                            ),
                                          ),

                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Cancelar"),
                                            ),

                                            TextButton(
                                              onPressed: () {
                                                final novoNome = controller.text.trim();

                                                if (novoNome.isNotEmpty) {
                                                  setState(() {
                                                    dispositivo.nome = novoNome;
                                                  });
                                                }

                                                Navigator.pop(context);
                                              },
                                              child: const Text("Salvar"),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }


                                    if (valor == "remover") {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text("Remover dispositivo"),
                                            content: Text(
                                              "Deseja realmente remover ${dispositivo.nome}?",
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text("Cancelar"),
                                              ),

                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    dispositivos.removeAt(index);
                                                  });

                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Remover",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },

                                  itemBuilder: (context) => const [
                                    PopupMenuItem(
                                      value: "renomear",
                                      child: Row(
                                        children: [
                                          Icon(Icons.edit_outlined),
                                          SizedBox(width: 10),
                                          Text("Renomear"),
                                        ],
                                      ),
                                    ),

                                    PopupMenuItem(
                                      value: "remover",
                                      child: Row(
                                        children: [
                                          Icon(Icons.delete_outline),
                                          SizedBox(width: 10),
                                          Text("Remover dispositivo"),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final dispositivo = await Navigator.push<DispositivoModelo>(
            context,
            MaterialPageRoute(
              builder: (context) => TelaAdicionarDispositivo(
              idsCadastrados: dispositivos.map((dispositivo) => dispositivo.idBluetooth).toList(),
              ),
            ),
          );

          if (dispositivo != null) {
            setState(() {
              dispositivos.add(dispositivo);
            });

            monitorarConexao(dispositivo);
          }
        },
        backgroundColor: AppCores.roxoMeioTermo,
        foregroundColor: AppCores.branco,
        child: const Icon(Icons.add),
      ),
    );
  }
}