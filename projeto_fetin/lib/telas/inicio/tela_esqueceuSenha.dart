import 'package:flutter/material.dart';
import 'package:projeto_fetin/tema/app_cores.dart';

class TelaEsqueceuSenha extends StatelessWidget {
  const TelaEsqueceuSenha({super.key});

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
                "Esqueceu sua senha?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Digite seu e-mail para receber um link de recuperação.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppCores.cinza,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(
                    hintText: "E-mail",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),

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
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppCores.roxoMeioTermo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),

                  onPressed: () {

                  },

                  child: const Text(
                    "Enviar link de recuperação",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}