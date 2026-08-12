class DispositivoModelo {
  final String idBluetooth;
  String nome;
  bool conectado;
  String distancia;
  String ultimaConexao;

  DispositivoModelo({
    required this.idBluetooth,
    required this.nome,
    this.conectado = true,
    this.distancia = "≈ 3 metros",
    this.ultimaConexao = "Agora",
  });
}