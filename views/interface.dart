import 'dart:io';
import '../models/categoria.dart';
import '../models/despesa.dart';
import '../services/gerenciador.dart';

class InterfaceUsuario {
  final GerenciadorFinanceiro _gerenciador;

  InterfaceUsuario(this._gerenciador);

  void iniciar() {
    String? opcao;
    while (opcao != '0') {
      _exibirMenu();
      opcao = stdin.readLineSync();
      _processarOpcao(opcao);
    }
    print("Obrigado por usar o Gerenciador Financeiro!");
  }

  void _exibirMenu() {
    print("\n--- Gerenciador Financeiro ---");
    print("[1] Adicionar Receita");
    print("[2] Adicionar Despesa");
    print("[3] Listar Todas as Transações");
    print("[4] Exibir Despesas por Categoria");
    print("[5] Exibir todas as Despesas"); 
    print("[6] Adicionar Nova Categoria"); 
    print("[0] Sair");
    print("Escolha uma opção: ");
  }

  void _processarOpcao(String? opcao) {
    switch (opcao) {
      case '1':
        _adicionarReceitaUI();
        break;
      case '2':
        _adicionarDespesaUI();
        break;
      case '3':
        _listarTransacoesUI();
        break;
      case '4':
        _exibirDespesasPorCategoriaUI();
        break;
      case '5':
        _exibirDespesasUI();
        break;
      case '6':
        _adicionarCategoriaUI();
        break;
      case '0':
        break;
      default:
        print("Opção inválida. Tente novamente.");
    }
  }

  void _adicionarCategoriaUI() {
    print("\n-- Adicionar Nova Categoria --");
    print("Digite o nome da nova categoria:");
    final nome = stdin.readLineSync();
    if (nome != null && nome.isNotEmpty) {
      final categoriaExistente = _gerenciador.adicionarCategoria(nome: nome);
      if (!categoriaExistente) {
        print("❌ Categoria '$nome' já existe. Tente outro nome.");
        _adicionarCategoriaUI(); 
        return;
      } else{
        print("✅ Categoria '$nome' adicionada com sucesso!");
      }
    } else {
      print("❌ Nome inválido. A operação foi cancelada.");
    }
  }

  void _adicionarReceitaUI() {
    print("\n-- Adicionar Receita --");
    print("Descrição:");
    final descricao = stdin.readLineSync() ?? '';
    print("Valor:");
    final valor = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
    
    _gerenciador.adicionarReceita(descricao: descricao, valor: valor);
    print("✅ Receita adicionada com sucesso!");
  }

  void _adicionarDespesaUI() {
    print("\n-- Adicionar Despesa --");
    print("Descrição:");
    final descricao = stdin.readLineSync() ?? '';
    print("Valor:");
    final valor = double.tryParse(stdin.readLineSync() ?? '') ?? 0.0;
    final categoria = _selecionarCategoriaUI();
    if (categoria != null) {
      _gerenciador.adicionarDespesa(descricao: descricao, valor: valor, categoria: categoria);
      print("✅ Despesa adicionada com sucesso!");
    } else {
      print("❌ Operação cancelada. Categoria inválida.");
    }
  }

  Categoria? _selecionarCategoriaUI() {
    print("Selecione a Categoria:");
    final categorias = _gerenciador.getCategorias();
    if (categorias.isEmpty) {
      print("Nenhuma categoria cadastrada. Cadastre uma primeiro.");
      return null;
    }
    
    for (var i = 0; i < categorias.length; i++) {
      print("[${i + 1}] ${categorias[i].nome}");
    }
    
    final escolha = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (escolha > 0 && escolha <= categorias.length) {
      return categorias[escolha - 1];
    }
    return null;
  }
  
  void _listarTransacoesUI() {
    print("\n--- 🧾 Extrato Completo ---");
    final transacoes = _gerenciador.getTodasTransacoes();
    if (transacoes.isEmpty) {
      print("Nenhuma transação registrada.");
    } else {
      transacoes.forEach((t) => print(t.formatarParaExibicao()));
    }
    print("--------------------------");
  }

  void _exibirDespesasUI () {
    print("\n--- 🧾 Extrato de Despesas ---");
    final despesas = _gerenciador.getDespesas();
    final total = despesas['total'] as double;
    final despesasList = despesas['despesas'] as List<Despesa>;
    if (despesas.isEmpty) {
      print("Nenhuma despesa registrada.");
    } else {
      despesasList.forEach((d) => print(d.formatarParaExibicao()));
        print("\n Total de despesas R\$ ${total.toStringAsFixed(2)}");
    }
    print("--------------------------");
  }

  void _exibirDespesasPorCategoriaUI() {
    print("\n-- Filtrar por Categoria --");
    final categoria = _selecionarCategoriaUI();
    if (categoria != null) {
      final resultado = _gerenciador.getDespesasPorCategoria(categoria);
      final despesas = resultado['despesas'] as List;
      final total = resultado['total'] as double;
      
      print("\n--- 🔎 Despesas da Categoria: ${categoria.nome} ---");
      if (despesas.isEmpty) {
        print("Nenhuma despesa encontrada para esta categoria.");
      } else {
        despesas.forEach((d) => print(d.formatarParaExibicao()));
        print("\n   Total gasto em ${categoria.nome}: R\$ ${total.toStringAsFixed(2)}");
      }
      print("------------------------------------------");
    } else {
      print("❌ Seleção de categoria inválida.");
    }
  }
}