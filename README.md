# Lista de Exercícios - Flutter

Repositório com os exercícios práticos desenvolvidos em Flutter para a disciplina, focando na construção de interfaces com componentes básicos, manipulação de estado reativo e regras de negócio.

---

## 👤 Identificação do Aluno

- **Nome Completo:** [Seu Nome Completo]
- **Turma / Disciplina:** [Nome da Disciplina]
- **Ambiente:** Visual Studio Code (VS Code) & Flutter SDK
- **Data:** Setembro / 2026

---

## 🎯 Objetivo e Escopo

Consolidar o fluxo fundamental de desenvolvimento reativo no Flutter:
Entrada de Dados → Conversão de Tipos → Regras de Negócio → Atualização Visual

### Conceitos Praticados:
- **Estrutura Básica:** `MaterialApp`, `Scaffold`, `AppBar`, `StatelessWidget` e `StatefulWidget`.
- **Layout & Posicionamento:** `Column`, `Row`, `Padding`, `SizedBox` e `MainAxisAlignment`.
- **Captura de Dados:** `TextField`, `TextEditingController`, `keyboardType` e `InputDecoration` (`OutlineInputBorder`).
- **Ciclo de Vida & Recursos:** Liberação de memória com `dispose()` / `super.dispose()` e limpeza visual com `controller.clear()`.
- **Estado Dinâmico:** Atualização da interface via `setState()`.
- **Conversões Seguras:** `int.tryParse()` e `double.tryParse()` com operador `?? 0`, além de tratamento de regras de borda (como proteção contra divisão por zero e saldo de estoque).

> ⚠️ **Nota de Escopo:** Em conformidade com os requisitos da atividade, não foram utilizados componentes avançados fora do módulo atual (como `ListView`, `Card`, `ListTile`, `Navigator` ou `Form`/`TextFormField`).

---

## 📁 Estrutura de Pastas do Repositório

```text
flutter-lista-exercicios/
├── README.md
├── exercicio01/       # Identificação do usuário
├── exercicio02/       # Verificador de idade (maioridade)
├── exercicio03/       # Antecessor e sucessor
├── exercicio04/       # Conversor de temperatura (Celsius para Fahrenheit)
├── exercicio05/       # Calculadora de média aritmética
├── exercicio06/       # Calculadora das quatro operações
├── exercicio07/       # Reajuste salarial
├── exercicio08/       # Consumo médio de combustível
├── exercicio09/       # Sistema simples de vendas com desconto
└── exercicio10/       # Controle de estoque com validação