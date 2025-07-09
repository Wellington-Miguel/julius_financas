import '../services/gerenciador.dart';
import '../views/interface.dart';

void main() {
  // 1. Cria a instância da camada de Serviço
  final gerenciador = GerenciadorFinanceiro();

  // (Opcional) Pré-cadastra algumas categorias para facilitar o uso inicial
  gerenciador.adicionarCategoria(nome: 'Moradia');
  gerenciador.adicionarCategoria(nome: 'Alimentação');
  gerenciador.adicionarCategoria(nome: 'Lazer');
  gerenciador.adicionarCategoria(nome: 'Transporte');
  
  // 2. Cria a instância da camada de Visão, injetando o serviço
  final ui = InterfaceUsuario(gerenciador);
  
  // 3. Inicia o programa
  ui.iniciar();
}