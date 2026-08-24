class UsuarioModelo {
  final int? id;
  final String nome;
  final String email;
  final String senhaHash;

  UsuarioModelo({
    this.id,
    required this.nome,
    required this.email,
    required this.senhaHash,
  });

  //transforma em dados sqlite
  Map<String, Object?> toMap() {
    return {'id': id, 'nome': nome, 'email': email, 'senha_hash': senhaHash};
  }

  factory UsuarioModelo.fromMap(Map<String, Object?> map) {
    return UsuarioModelo(
      id: map['id'] as int,
      nome: map['nome'] as String,
      email: map['email'] as String,
      senhaHash: map['senha_hash'] as String,
    );
  }
}
