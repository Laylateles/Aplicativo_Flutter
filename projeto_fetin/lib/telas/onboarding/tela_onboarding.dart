import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../modelo/telaModelo.dart';
import '../inicio/tela_login.dart';
import 'package:projeto_fetin/tema/app_cores.dart';
class TelaOnboarding extends StatefulWidget {
  const TelaOnboarding({super.key});

  @override
  State<TelaOnboarding> createState() => _TelaOnboardingState();
}

class _TelaOnboardingState extends State<TelaOnboarding> {

  final PageController controladorPagina = PageController();

  int paginaAtual = 0;
  final List<telaModelo> paginas = [

  telaModelo(
    titulo: "Bem-vindo ao KeepClose",
    descricao: "Acompanhe em tempo real o que é importante para você.",
    imagem: "assets/imagens/imagem-onboarding1.svg",// imagem ok
  ),

  telaModelo(
    titulo: "Segurança em tranquilidade",
    descricao: "Receba alertas e fique sempre informado",
    imagem: "assets/imagens/imagem-onboarding2.svg",//imagem provisoria
  ),

  telaModelo(
    titulo: "Conecte quem você ama",
    descricao: "Convide familiares e amigos e matenha todos conectados.",
    imagem: "assets/imagens/imagem-onboarding3.svg",//imagem provisoria
  ),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          paginaAtual != paginas.length - 1
          ? Padding(
              padding: const EdgeInsets.only(
                top: 5,
                right: 5,
              ),

              child: Align(
                alignment: Alignment.centerRight,

                child: TextButton(
                  onPressed: () {

                    controladorPagina.animateToPage(
                      paginas.length - 1,

                      duration: const Duration(milliseconds: 400),

                      curve: Curves.easeInOut,
                    );

                  },

                  child: const Text("Pular"),
                ),
              ),
            )
          : const SizedBox(height: 37, width: 5),//tive que fazer essa gambiarra porque a tela tava subindo
          Expanded(
            child: PageView(
              controller: controladorPagina,

              onPageChanged: (index) {
                setState(() {
                  paginaAtual = index;
                });
              },

              children: paginas.map((pagina) {

                return Container(
                  padding: const EdgeInsets.all(32),

                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Text(
                        pagina.titulo,

                        textAlign: TextAlign.center,

                        style: const TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        pagina.descricao,

                        textAlign: TextAlign.center,

                        style: const TextStyle(
                          fontSize: 16,
                          height: 1.5,
                        
                        ),
                      ),
                      const SizedBox(height: 15),
                      SvgPicture.asset(
                        pagina.imagem,
                        height: 260,
                      ),
                    ],
                  ),
                );

              }).toList(),
            ),
          ),
          Row(// bolinha das paginas
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(// cria a bolinha para cada pagina
              paginas.length,
              (index) {

                return Container(
                  margin: const EdgeInsets.all(4),

                  width: paginaAtual == index ? 24 : 10,
                  height: 10,

                  decoration: BoxDecoration(
                    color: paginaAtual == index
                        ? AppCores.roxoMeioTermo
                        : Colors.grey.shade300,

                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Padding(// botões de navegação
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  backgroundColor: AppCores.roxoMeioTermo,// cor do botão
                  foregroundColor: AppCores.brancoRoxinho,//cor do texto
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  if (paginaAtual < paginas.length - 1) {
                    controladorPagina.animateToPage(
                      paginaAtual + 1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );

                  } else {
                    Navigator.pushReplacement(//troca a tela atual pela tela nova
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaLogin(),
                      ),
                    );
                  }
                },
                child: Text(
                  paginaAtual == paginas.length - 1
                      ? "Começar"
                      : "Próximo",
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}