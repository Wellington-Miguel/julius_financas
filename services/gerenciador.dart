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


  bool adicionarCategoria({required String nome}) {
    final nomePadronizado = nome.toLowerCase();
    final categoriaExistente = _categorias.where((c) => c.nome.toLowerCase() == nomePadronizado).firstOrNull;
    if (categoriaExistente != null) {
      return false;
    }
    final novaCategoria = Categoria(id: _proximoIdCategoria++, nome: nome);
    _categorias.add(novaCategoria);
    return true;
  }
  
  List<Categoria> getCategorias() {
    return List.unmodifiable(_categorias); 
  }

  Categoria? getCategoriaPorId(int id) {
    return _categorias.where((c) => c.id == id).firstOrNull;
  }

  void adicionarReceita({required String descricao, required double valor}) {
    _transacoes.add(Receita(id: _proximoIdTransacao++, descricao: descricao, valor: valor));
  }

  void adicionarDespesa({required String descricao, required double valor, required Categoria categoria}) {
    _transacoes.add(Despesa(id: _proximoIdTransacao++, descricao: descricao, valor: valor, categoria: categoria));
  }

  List<Transacao> getTodasTransacoes() {
    _transacoes.sort((a, b) => a.data.compareTo(b.data));
    return List.unmodifiable(_transacoes);
  }

  Map<String, Object> getDespesas() {
    final despesasTotal = _transacoes
        .whereType<Despesa>()
        .toList()
      ..sort((a, b) => a.data.compareTo(b.data));
    final totalGasto = _transacoes.fold<double>(0, (soma, despesa) => soma + despesa.valor);
    return {
      'despesas': despesasTotal,
      'total': totalGasto,
      };
    } 

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