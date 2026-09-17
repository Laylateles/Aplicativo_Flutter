class DispositivoModelo {
  final String idBluetooth;
  final int usuarioId;
  String nome;
  bool conectado;
  String distancia;
  String ultimaConexao;
  int? rssi;
  String proximidade;

  DispositivoModelo({
    required this.idBluetooth,
    required this.usuarioId,
    required this.nome,
    this.conectado = true,
    this.distancia = "Calculando...",
    this.ultimaConexao = "Agora",
    this.rssi,
    this.proximidade = "Aguardando sinal",
  });

  Map<String, Object?> toMap() {
    return {
      'id_bluetooth': idBluetooth,
      'usuario_id': usuarioId, //vincula a tag ao usuário autenticado
      'nome': nome,
      'conectado': conectado ? 1 : 0,
      'distancia': distancia,
      'ultima_conexao': ultimaConexao,
      'rssi': rssi,
      'proximidade': proximidade,
    };
  }

  factory DispositivoModelo.fromMap(Map<String, Object?> map) {
    return DispositivoModelo(
      idBluetooth: map['id_bluetooth'] as String,
      usuarioId: map['usuario_id'] as int,
      nome: map['nome'] as String,
      conectado: (map['conectado'] as int) == 1,
      distancia: map['distancia'] as String,
      ultimaConexao: map['ultima_conexao'] as String,
      rssi: map['rssi'] as int?,
      proximidade: map['proximidade'] as String,
    );
  }
}
