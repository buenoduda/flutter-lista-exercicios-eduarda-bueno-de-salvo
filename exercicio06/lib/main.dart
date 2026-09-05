// exercício 06 - calculadora dquatro operações
// Crie uma calculadora com dois campos numéricos e quatro botões correspondentes às operações básicas.

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
      home: TelaCalculadora(),
    );
  }
}

class TelaCalculadora extends StatefulWidget {
  const TelaCalculadora({super.key});

  @override
  State<TelaCalculadora> createState() => _TelaCalculadoraState();
}

class _TelaCalculadoraState extends State<TelaCalculadora> {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();

  String mensagem = '';

  void soma() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    double soma = num1 + num2;
    setState(() {
      mensagem = 'Resuldado = $soma';
    });
  }

  void subtracao() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    double subtracao = num1 - num2;
    setState(() {
      mensagem = 'Resuldado = $subtracao';
    });
  }

  void multiplicacao() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    double multiplicacao = num1 * num2;
    setState(() {
      mensagem = 'Resuldado = $multiplicacao';
    });
  }

  void divisao() {
    double num1 = double.tryParse(num1Controller.text) ?? 0;
    double num2 = double.tryParse(num2Controller.text) ?? 0;

    double divisao = num1 / num2;
    setState(() {
      if (num2 != 0) {
        mensagem = 'Resuldado = $divisao';
      } else {
        mensagem = 'Não é possível dividir por 0';
      }
    });
  }

  void limparCampos() {
    num1Controller.clear();
    num2Controller.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    num1Controller.dispose();
    num2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Média Aluno')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Insira o primeiro número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: num2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Insira o segundo número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
    
            Row( // botões
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: soma, child: Text('+')),
                SizedBox(width: 20), // espaçamento entre os botões
                ElevatedButton(onPressed: subtracao, child: Text('-')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: multiplicacao, child: Text('×')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: divisao, child: Text('÷')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limparCampos, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 20),
            Text(mensagem, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
