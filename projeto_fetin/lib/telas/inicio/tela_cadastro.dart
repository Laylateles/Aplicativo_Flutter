import 'package:flutter/material.dart';
import 'package:projeto_fetin/tema/app_cores.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  bool esconderSenha = true;
  bool esconderConfirmarSenha = true;
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
              Row(
                  mainAxisSize: MainAxisSize.min,

                  children: const [

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
                "Criar conta",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "É rápido e fácil!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Nome completo",

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
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  obscureText: esconderSenha,

                  decoration: InputDecoration(
                    hintText: "Senha",

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          esconderSenha = !esconderSenha;
                        });
                      },

                      icon: Icon(
                        esconderSenha
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

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
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: TextField(
                  obscureText: esconderConfirmarSenha,

                  decoration: InputDecoration(
                    hintText: "Confirmar senha",

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          esconderConfirmarSenha = !esconderConfirmarSenha;
                        });
                      },

                      icon: Icon(
                        esconderConfirmarSenha
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),

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
                    foregroundColor: AppCores.branco,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),

                  onPressed: () {

                  },

                  child: const Text(
                    "Cadastrar",
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