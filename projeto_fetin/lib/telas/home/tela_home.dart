import 'package:flutter/material.dart';
import 'tela_adicionar_dispositivo.dart';
import '../modelo/dispositivo_modelo.dart';
import 'package:projeto_fetin/tema/app_cores.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  final List<DispositivoModelo> dispositivos = [];//guarda temporariamente os nomes adicionados

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

                                      const SizedBox(height: 6),

                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 11,
                                            color: Colors.green,
                                          ),

                                          SizedBox(width: 7),

                                          Text(
                                            "Dispositivo configurado",
                                            style: TextStyle(
                                              color: AppCores.cinza,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: AppCores.cinza,
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
              dispositivos.add(dispositivo);//adiciona o nome na lista 
            });
          }
        },
        backgroundColor: AppCores.roxoMeioTermo,
        foregroundColor: AppCores.branco,
        child: const Icon(Icons.add),
      ),
    );
  }
}