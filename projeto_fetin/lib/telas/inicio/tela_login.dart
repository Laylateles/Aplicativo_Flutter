import 'package:flutter/material.dart';
import 'package:projeto_fetin/tema/app_cores.dart';
import 'tela_cadastro.dart';
import 'tela_esqueceuSenha.dart';
import '../home/tela_home.dart';
class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});
  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  bool senhaOculta = true;
  final TextEditingController emailController = TextEditingController();// permite controlar o texto digitado no campo de e-mail
  final TextEditingController senhaController = TextEditingController();// permite controlar o texto digitado no campo de senha
  bool formularioValido = false;
  String? erroEmail;
  String? erroSenha;

  void validarFormulario() {
    //para validar as entradas do usuario
    setState(() {
      if (emailController.text.isNotEmpty && !emailController.text.contains('@')) {
        erroEmail = "Digite um e-mail válido";
      } else {
        erroEmail = null;
      }
      if (senhaController.text.isNotEmpty && senhaController.text.length < 6) {
        erroSenha = "A senha deve ter pelo menos 6 caracteres";
      } else {
        erroSenha = null;
      }
      formularioValido = emailController.text.isNotEmpty && senhaController.text.isNotEmpty && erroEmail == null && erroSenha == null;
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
             /* Align( -- comentei o icone que tinha a esquerda
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
            
              const SizedBox(height: 20),*/
//--------------------------------------------------------------------------------
              Center(
                // logo do aplicativo
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppCores.roxoMeioTermo,
                      size: 40,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "KeepClose",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppCores.roxoMeioTermo,
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
                  hintText: "E-mail", // é o texto que aparece antes do usuario digitar
                  errorText: erroEmail,
                  hintStyle: TextStyle(color: AppCores.cinza),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(113,119,119,119,), // cor do contorno do campo de e-mail
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppCores.roxoClaro,
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
                  errorText: erroSenha,
                  hintStyle: TextStyle(color: AppCores.cinza),
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
                      color: AppCores.roxoClaro,
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
                child: TextButton(
                  // transforma qualquer widget em algo clicavel
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TelaEsqueceuSenha(),
                          ),
                        );
                  },

                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),

                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                      color: AppCores.roxoMeioTermo,
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
                      ? AppCores.roxoClaro
                      : AppCores.cinza,
                    foregroundColor: AppCores.brancoRoxinho,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    elevation: 0,
                  ),
                  onPressed: formularioValido ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaHome(),
                      ),
                    );
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
                          color: AppCores.berandoPreto),
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
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TelaCadastro(),
                          ),
                        );
                      },

                      style: TextButton.styleFrom(// isso é usado para remover o padding do botão e deixar o texto mais próximo do outro texto
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),

                      child: const Text(
                        "Cadastre-se",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppCores.roxoMeioTermo,
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