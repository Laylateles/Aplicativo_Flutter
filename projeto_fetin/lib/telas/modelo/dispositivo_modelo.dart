class DispositivoModelo {
  final String idBluetooth;
  String nome;
  bool conectado;
  String distancia;
  String ultimaConexao;
  int? rssi;
  String proximidade;

  DispositivoModelo({
    required this.idBluetooth,
    required this.nome,
    this.conectado = true,
    this.distancia = "Calculando...",
    this.ultimaConexao = "Agora",
    this.rssi,
    this.proximidade = "Aguardando sinal",
  });
}