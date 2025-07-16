import '../services/gerenciador.dart';
import '../views/interface.dart';

void main() {
  final gerenciador = GerenciadorFinanceiro();
  final interface = InterfaceUsuario(gerenciador);
  interface.iniciar();
}