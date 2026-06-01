import 'package:flutter/material.dart';
import 'package:projeto_fetin/nucleo/tema/app_cores.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});
  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool senhaOculta = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  bool formularioValido = false;

  void validarFormulario() {
    //para validar as entradas do usuario
    setState(() {
      formularioValido =
          emailController.text.isNotEmpty && senhaController.text.isNotEmpty;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            // todas as margens do container
            horizontal: 24,
            vertical: 16,
          ),

          child: Column(
            children: [
              //tudo deve estar aqui dentro
              //--------------------------------------------------------------------------
              Align(
                //botão da esquerda
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                  ),
                ),
              ),
            
              const SizedBox(height: 20),
//--------------------------------------------------------------------------------
              Center(
                // logo do aplicativo
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppCores.keepClose,
                      size: 40,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "KeepClose",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppCores.keepClose,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
//------------------------------------------------------------------------------
              const Align(
                // texto de boas vindas
                alignment: Alignment.centerLeft,
                child: Text(
                  "Bem-vindo de volta",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
//--------------------------------------------------------------------------------
              const Align(
                // texto de faça login para continuar
                alignment: Alignment.centerLeft,
                child: Text(
                  "Faça login para continuar",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 73, 69, 69),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 32),
//--------------------------------------------------------------------------------------------------
              TextField(
                // criando o campo de e-mail -- aqui é o campo onde o usuario digita
                controller: emailController,
                onChanged: (value) {
                  validarFormulario();
                },
                decoration: InputDecoration(
                  hintText:
                      "E-mail", // é o texto que aparece antes do usuario digitar
                  hintStyle: TextStyle(color: AppCores.textLight),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(113,119,119,119,), // cor do contorno do campo de e-mail
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppCores.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
//---------------------------------------------------------------------------------------------
              TextField(
                // campo de senha
                controller: senhaController,
                obscureText: senhaOculta, //quando o usuario digitar a senha ela não vai aparecer os numeros e sim asteriscos
                onChanged: (value) {
                  validarFormulario();
                },  
                decoration: InputDecoration(
                  hintText: "Senha",
                  hintStyle: TextStyle(color: AppCores.textLight),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        senhaOculta = !senhaOculta;
                      });
                    },
                    icon: Icon(
                      senhaOculta
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(120, 119, 119, 119),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppCores.primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
//-----------------------------------------------------------------------------------------------
              Align(
                //frase esqueceu a senha
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  // transforma qualquer widget em algo clicavel
                  onTap: () {},
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: AppCores.keepClose,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
//---------------------------------------------------------------------------------------
              SizedBox(
                // botão entrar
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: formularioValido
                      ? AppCores.primary
                      : AppCores.textLight,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  onPressed: formularioValido
                    ? () {
                        print("Login realizado");
                      }
                    : null,
                  child: const Text(
                    "Entrar",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 24),
//--------------------------------------------------------------------------------------
              Row(
                // texto abaixo do esqueceu a senha
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "ou continue com",
                      style: TextStyle(
                        color: Color.fromARGB(204, 73, 69, 69),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
//----------------------------------------------------------------------------------------
              SizedBox(
                // botão do google
                width: double.infinity,
                height: 45,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.g_mobiledata, size: 32),
                      const SizedBox(width: 6),
                      const Text(
                        "Google",
                        style: TextStyle(
                          color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
//--------------------------------------------------------------------------------------
              Center(
                //rodape da pagina
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Não tem uma conta? ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        "Cadastre-se",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppCores.keepClose,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ], // children -- tudo tem de estar aqui dentro
          ),
        ),
      ),
    );
  }
}