import 'package:flutter/material.dart';
import '../modelo/dispositivo_modelo.dart';
import 'package:projeto_fetin/tema/app_cores.dart';

class TelaNomearDispositivo extends StatefulWidget {
  final String nomeBluetooth;

  const TelaNomearDispositivo({
    super.key,
    required this.nomeBluetooth,
  });

  @override
  State<TelaNomearDispositivo> createState() => _TelaNomearDispositivoState();
}

class _TelaNomearDispositivoState extends State<TelaNomearDispositivo> {
  final TextEditingController nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
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

              const SizedBox(height: 20),

              const Icon(
                Icons.bluetooth_connected,
                size: 70,
                color: AppCores.roxoMeioTermo,
              ),

              const SizedBox(height: 20),

              const Text(
                "Dispositivo encontrado!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Text(
                  widget.nomeBluetooth,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppCores.roxoMeioTermo,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              const Text(
                "Dê um nome à sua tag para identificar qual objeto ela está protegendo.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: AppCores.cinza,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: nomeController,

                decoration: InputDecoration(
                  hintText: "Ex.: Mochila da faculdade",

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppCores.cinza,
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppCores.roxoMeioTermo,
                      width: 2,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                  final nomeDigitado = nomeController.text.trim();// le o texto e remove os espaçoes desnecessarios

                  if (nomeDigitado.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Digite um nome para o dispositivo.",
                        ),
                      ),
                    );

                    return;
                  }

                  Navigator.pop(
                    context,
                    DispositivoModelo(
                      idBluetooth: widget.nomeBluetooth,
                      nome: nomeDigitado,
                    ),
                  );
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCores.roxoMeioTermo,
                    foregroundColor: AppCores.branco,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Salvar dispositivo",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}