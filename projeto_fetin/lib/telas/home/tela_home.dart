import 'package:flutter/material.dart';
import 'tela_adicionar_dispositivo.dart';
import 'package:projeto_fetin/tema/app_cores.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

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
              const SizedBox(height: 40),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.bluetooth_searching,//icone do bluethoot
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
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const TelaAdicionarDispositivo(),
            ),
          );
        },
        backgroundColor: AppCores.roxoMeioTermo,
        foregroundColor: AppCores.branco,
        child: const Icon(Icons.add),
      ),
    );
  }
}