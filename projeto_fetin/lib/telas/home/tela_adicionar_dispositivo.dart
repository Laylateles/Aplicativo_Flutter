import 'package:flutter/material.dart';
import 'tela_nomear_dispositivo.dart';
import '../modelo/dispositivo_modelo.dart';
import 'package:projeto_fetin/tema/app_cores.dart';

class TelaAdicionarDispositivo extends StatelessWidget {
  final List<String> idsCadastrados;// para saber quais tags ja foram cadastradas

  const TelaAdicionarDispositivo({
    super.key,
    required this.idsCadastrados,
  });

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

                Column(
                  children: [
                    if (!idsCadastrados.contains("KeepClose_TAG_01"))
                    ListTile(// exemplos
                      leading: const Icon(
                        Icons.bluetooth,
                        color: AppCores.roxoMeioTermo,
                      ),
                      title: const Text("KeepClose_TAG_01"),
                      subtitle: const Text("Sinal forte"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () async {
                        final dispositivo =
                            await Navigator.push<DispositivoModelo>(// ele espera o usuario digitar o nome de tag
                            context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TelaNomearDispositivo(
                              nomeBluetooth: "KeepClose_TAG_01",
                            ),
                          ),
                        ); // estou fazendo tudo isso para poder adicionar na tela principal os dados da tag de forma dinamica

                        if (dispositivo != null && context.mounted) {
                          Navigator.pop(context, dispositivo);
                        }
                      },
                    ),

                    const Divider(),
                    if (!idsCadastrados.contains("KeepClose_TAG_02"))
                    ListTile(
                      leading: const Icon(
                        Icons.bluetooth,
                        color: AppCores.roxoMeioTermo,
                      ),
                      title: const Text("KeepClose_TAG_02"),
                      subtitle: const Text("Sinal médio"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () async {
                          final dispositivo =
                            await Navigator.push<DispositivoModelo>(// ele espera o usuario digitar o nome de tag
                            context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const TelaNomearDispositivo(
                              nomeBluetooth: "KeepClose_TAG_02",
                            ),
                          ),
                        ); // estou fazendo tudo isso para poder adicionar na tela principal os dados da tag de forma dinamica

                        if (dispositivo != null && context.mounted) {
                          Navigator.pop(context, dispositivo);
                        }
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}