import 'transacao.dart';

class Receita extends Transacao {
  Receita({
    required super.id,
    required super.descricao,
    required super.valor,
    super.dataTransacao,
  });

  @override
  String formatarParaExibicao() {
    return '[ID: $id] (+) Receita: $descricao | Valor: R\$ ${valor.toStringAsFixed(2)} | Data: ${data.day}/${data.month}/${data.year}';
  }
}