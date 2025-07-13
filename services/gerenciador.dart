import '../models/categoria.dart';
import '../models/despesa.dart';
import '../models/receita.dart';
import '../models/transacao.dart';

class GerenciadorFinanceiro {
  final List<Transacao> _transacoes = [];
  final List<Categoria> _categorias = [];
  int _proximoIdTransacao = 0;
  int _proximoIdCategoria = 0;

  GerenciadorFinanceiro() {
    _cadastrarCategoriasIniciais();
  }

    void _cadastrarCategoriasIniciais() {
    adicionarCategoria(nome: 'Moradia');
    adicionarCategoria(nome: 'Alimentação');
    adicionarCategoria(nome: 'Lazer');
    adicionarCategoria(nome: 'Transporte');
    adicionarCategoria(nome: 'Saúde');
    adicionarCategoria(nome: 'Outros');
  }

  // --- Métodos de Categoria ---
  Categoria adicionarCategoria({required String nome}) {
    final nomeLower = nome.toLowerCase();
    final categoriaExistente = _categorias.where((c) => c.nome.toLowerCase() == nomeLower).firstOrNull;
    if (categoriaExistente != null) {
      return categoriaExistente;
    }
    final novaCategoria = Categoria(id: _proximoIdCategoria++, nome: nome);
    _categorias.add(novaCategoria);
    return novaCategoria;
  }
  
  List<Categoria> getCategorias() {
    return List.unmodifiable(_categorias); // Retorna uma cópia para proteger a lista original
  }

  Categoria? getCategoriaPorId(int id) {
    return _categorias.where((c) => c.id == id).firstOrNull;
  }

  // --- Métodos de Transação ---
  void adicionarReceita({required String descricao, required double valor}) {
    _transacoes.add(Receita(id: _proximoIdTransacao++, descricao: descricao, valor: valor));
  }

  void adicionarDespesa({required String descricao, required double valor, required Categoria categoria}) {
    _transacoes.add(Despesa(id: _proximoIdTransacao++, descricao: descricao, valor: valor, categoria: categoria));
  }

  // MÉTODO REATORADO: Agora retorna a lista de transações.
  List<Transacao> getTodasTransacoes() {
    _transacoes.sort((a, b) => a.data.compareTo(b.data));
    return List.unmodifiable(_transacoes);
  }

  // MÉTODO REATORADO: Agora retorna um Mapa com os dados do relatório.
  Map<String, dynamic> getDespesasPorCategoria(Categoria categoria) {
    final despesasDaCategoria = _transacoes
        .whereType<Despesa>()
        .where((despesa) => despesa.categoria.id == categoria.id)
        .toList();

    final totalGasto = despesasDaCategoria.fold<double>(0, (soma, despesa) => soma + despesa.valor);

    return {
      'despesas': despesasDaCategoria,
      'total': totalGasto,
    };
  }
}