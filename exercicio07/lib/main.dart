// Exercício 07 - Reajuste Salarial
// Crie um aplicativo que receba o nome do funcionário, seu salário atual e o percentual de reajuste. Calcule o valor do aumento e o novo salário.

import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaReajusteSalarial(),
    );
  }
}

class TelaReajusteSalarial extends StatefulWidget {
  const TelaReajusteSalarial({super.key});

  @override
  State<TelaReajusteSalarial> createState() => _TelaReajusteSalarialState();
}

class _TelaReajusteSalarialState extends State<TelaReajusteSalarial> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController salarioController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();

  String mensagem = '';

  void reajusteSalarial() {
    String funcionario = nomeController.text;
    double salario = double.tryParse(salarioController.text.replaceAll(',', '.')) ?? 0;
    double percentual = double.tryParse(percentualController.text.replaceAll(',', '.')) ?? 0;

    double aumento = salario * percentual / 100;
    double novoSalario = salario + aumento;

    setState(() {
      mensagem =
          'Funcionário: $funcionario\n'
          'Salário atual: R\$ ${salario.toStringAsFixed(2)}\n'
          'Aumento: R\$ ${aumento.toStringAsFixed(2)}\n'
          'Novo salário: R\$ ${novoSalario.toStringAsFixed(2)}';
    });
  }

  void limparCampos() {
    nomeController.clear();
    salarioController.clear();
    percentualController.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nomeController.dispose();
    salarioController.dispose();
    percentualController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reajuste de Salário')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome do funcionário',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: salarioController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Salário atual (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: percentualController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Percentual de reajuste (%)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: reajusteSalarial,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: limparCampos,
                  child: Text('Limpar'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              mensagem,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}