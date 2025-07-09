import 'categoria.dart';
import 'transacao.dart';

class Despesa extends Transacao {
  final Categoria categoria;

  Despesa({
    required super.id,
    required super.descricao,
    required super.valor,
    required this.categoria,
    super.dataTransacao,
  });

  @override
  String formatarParaExibicao() {
    return '[ID: $id] (-) Despesa: $descricao | Categoria: ${categoria.nome} | Valor: R\$ ${valor.toStringAsFixed(2)} | Data: ${data.day}/${data.month}/${data.year}';
  }
}