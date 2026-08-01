import 'package:flutter/material.dart';
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
              const SizedBox(height: 30),

              Container(// aqui é o container do dispositivo, ele tem uma cor de fundo, borda arredondada e sombra -- a caixa que contem as informações da tag que o usuario cadastrou
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: AppCores.branco,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: AppCores.berandoPreto,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(
                      children: const [

                        Icon(
                          Icons.backpack,// icone da mochila
                          color: AppCores.roxoMeioTermo,
                          size: 32,
                        ),

                        SizedBox(width: 12),

                        Text(
                          "Mochila Faculdade",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      children: const [

                        Icon(
                          Icons.circle,
                          color: Colors.green,// porque ta conectado
                          size: 12,
                        ),

                        SizedBox(width: 8),

                        Text(
                          "Conectado",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Distância aproximada",

                      style: TextStyle(
                        color: AppCores.cinza,
                      ),
                    ),

                    const SizedBox(height: 4),

                    const Text(
                      "≈ 3 metros",

                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: AppCores.roxoMeioTermo,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}