abstract class Transacao {
  final int id;
  final String descricao;
  final double valor;
  final DateTime data;

  Transacao({
    required this.id,
    required this.descricao,
    required this.valor,
    DateTime? dataTransacao,
  }) : data = dataTransacao ?? DateTime.now();

  // Este método será usado pela camada de Visão para formatar a saída.
  String formatarParaExibicao();
}