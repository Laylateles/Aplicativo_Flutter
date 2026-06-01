import 'package:flutter/material.dart';
import 'nucleo/tema/app_tema.dart';
import 'telas/splash/tela_splash.dart';
import 'package:flutter/gestures.dart';// para poder usar o mouse para arrastar a tela

void main() {
  runApp(const KeepCloseApp());
}

class KeepCloseApp extends StatelessWidget {
  const KeepCloseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(//raiz do app Flutter, ele controla tudo
      debugShowCheckedModeBanner: false,

      title: 'KeepClose',

      theme: AppTema.lightTheme,

      scrollBehavior: MeuScroll(),

      home: const TelaSplash(),
    );
  }
}

class MeuScroll extends MaterialScrollBehavior {// para poder arrastar as paginas
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}