import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../modelos/onboarding_modelo.dart';

class TelaOnboarding extends StatefulWidget {
  const TelaOnboarding({super.key});

  @override
  State<TelaOnboarding> createState() => _TelaOnboardingState();
}

class _TelaOnboardingState extends State<TelaOnboarding> {

  final PageController controladorPagina = PageController();

  int paginaAtual = 0;
  final List<OnboardingModelo> paginas = [

  OnboardingModelo(
    titulo: "Bem-vindo ao KeepClose",
    descricao: "Acompanhe em tempo real o que é importante para você.",
    imagem: "assets/imagens/imagem-onboarding1.svg",
  ),

  OnboardingModelo(
    titulo: "Segurança em tranquilidade",
    descricao: "Receba alertas e fique sempre informado",
    imagem: "assets/imagens/imagem-onboarding2.svg",
  ),

  OnboardingModelo(
    titulo: "Conecte quem você ama",
    descricao: "Convide familiares e amigos e matenha todos conectados.",
    imagem: "",
  ),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controladorPagina,

        onPageChanged: (index) {
          setState(() {
            paginaAtual = index;
          });
        },

        children: paginas.map((pagina){
          return Container(
             padding: const EdgeInsets.all(32),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SvgPicture.asset(
                pagina.imagem,
                height: 260,
              ),
              const SizedBox(height: 40),

              Text(
                pagina.titulo,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Text(
                pagina.descricao,

                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ); }).toList(),
      ),
    );
  }
}