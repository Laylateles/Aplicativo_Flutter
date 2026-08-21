import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoDados {
  BancoDados._();

  static final BancoDados instancia = BancoDados._();

  static const String nomeBanco = 'keepclose.db';
  static const int versaoBanco = 1;

  Database? _banco;
}

