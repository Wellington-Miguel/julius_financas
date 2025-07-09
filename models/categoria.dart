class Categoria {
  final int id;
  final String nome;

  Categoria({required this.id, required this.nome});

  @override
  String toString() {
    return nome;
  }
}