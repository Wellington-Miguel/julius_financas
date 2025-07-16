
# Gerenciador Financeiro Pessoal 

Um aplicativo de console simples, porém robusto, para gerenciamento de finanças pessoais, desenvolvido como projeto prático de Programação Orientada a Objetos.

-----

## 📜 Índice

  * Visão Geral
  * Funcionalidades
  * Arquitetura do Projeto
  * Tecnologias Utilizadas
  * Como Executar
  * Demonstração
  * Autor

-----

## 📖 Visão Geral

O Gerenciador Financeiro Pessoal é uma ferramenta de linha de comando que permite ao usuário registrar e organizar suas receitas e despesas. O objetivo principal do projeto é aplicar de forma prática os conceitos fundamentais da Programação Orientada a Objetos (POO) em uma aplicação funcional e bem estruturada.

A aplicação opera de forma interativa através de um menu no console, guiando o usuário através das diversas funcionalidades disponíveis.

-----

## ✨ Funcionalidades

  * **Adicionar Receitas:** Registre entradas de dinheiro com descrição e valor.
  * **Adicionar Despesas:** Registre saídas de dinheiro, associando cada uma a uma categoria.
  * **Listar Transações:** Exiba um extrato completo com todas as receitas e despesas, ordenado por data.
  * **Filtrar por Categoria:** Gere relatórios detalhados com os gastos de uma categoria específica.
  * **Exibir Resumo de Despesas:** Visualize uma lista com todas as despesas e o total gasto.
  * **Cadastro de Categorias:** Crie novas categorias de gastos para personalizar a organização financeira.
  * **Categorias Padrão:** O sistema já inicia com um conjunto de categorias pré-definidas para facilitar o uso imediato.

-----

## 🏗️ Arquitetura do Projeto

 **Arquitetura em Camadas (Layered Architecture)**
```
gerenciador_financeiro/
|
|-- lib/
|   |-- models/         # (Camada de Modelo) Define a estrutura dos dados.
|   |-- services/       # (Camada de Serviço) Contém a lógica de negócio.
|   |-- view/           # (Camada de Visão) Responsável pela interface com o usuário.
|
|-- bin/
|   |-- main.dart       # Ponto de entrada que inicializa e conecta as camadas.
|
|-- README.md           # Este arquivo.
```


-----

## 🛠️ Tecnologias Utilizadas

  * **Dart SDK:** Versão 3.x ou superior.

-----

## 🚀 Como Executar

Para executar o projeto em sua máquina local, siga os passos abaixo:

1.  **Pré-requisito:** Certifique-se de ter o [Dart SDK](https://dart.dev/get-dart) instalado e configurado corretamente no seu sistema. Para verificar, rode o comando:

    ```bash
    dart --version
    ```

2.  **Clone ou Baixe o Projeto:** Tenha todos os arquivos do projeto em uma pasta no seu computador.

3.  **Navegue até a Pasta:** Abra o seu terminal e navegue até a pasta raiz do projeto.

    ```bash
    cd caminho/para/seu_projeto
    ```

4.  **Execute o Programa:** Use o comando `dart run` para iniciar a aplicação.

    ```bash
    dart run bin/main.dart
    ```

A interface interativa do programa será iniciada no seu terminal.

-----

## 🖥️ Demonstração

Abaixo, um exemplo da interação com o menu principal do programa:

```
--- Gerenciador Financeiro ---
[1] Adicionar Receita
[2] Adicionar Despesa
[3] Listar Todas as Transações
[4] Exibir Despesas por Categoria
[5] Exibir todas as Despesas
[6] Adicionar Nova Categoria
[0] Sair
Escolha uma opção:
2

-- Adicionar Despesa --
Descrição:
Almoço
Valor:
25.50
Selecione a Categoria:
[1] Moradia
[2] Alimentação
[3] Lazer
[4] Transporte
[5] Saúde
[6] Outros
2
✅ Despesa adicionada com sucesso!
```

-----

## ✍️ Autor

Feito por **Wellington Miguel**

-----

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.
