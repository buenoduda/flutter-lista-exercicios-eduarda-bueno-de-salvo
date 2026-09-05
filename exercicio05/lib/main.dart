// exercício 05 - calculadora de média
// Crie uma aplicação que receba três notas, calcule a média e apresente a situação do aluno

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
      home: TelaMediaAluno(),
    );
  }
}

class TelaMediaAluno extends StatefulWidget {
  const TelaMediaAluno({super.key});

  @override
  State<TelaMediaAluno> createState() => _TelaMediaAlunoState();
}

class _TelaMediaAlunoState extends State<TelaMediaAluno> {
  final TextEditingController nota1Controller = TextEditingController();
  final TextEditingController nota2Controller = TextEditingController();
  final TextEditingController nota3Controller = TextEditingController();

  String mensagem = '';

  void mediaAluno() {
    double nota1 = double.tryParse(nota1Controller.text) ?? 0;
    double nota2 = double.tryParse(nota2Controller.text) ?? 0;
    double nota3 = double.tryParse(nota3Controller.text) ?? 0;

    double media = (nota1 + nota2 + nota3) / 3;

    setState(() {
      if (media >= 6) {
        mensagem = 'Média: ${media.toStringAsFixed(1)} \nSituação: Aprovado!';
      } else {
        mensagem = 'Média: ${media.toStringAsFixed(1)} \nSituação: Reprovado.';
      }
    });
  }

  void limparCampos() {
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
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
              controller: nota1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Insira a primeira nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: nota2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Insira a segunda nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: nota3Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Insira a terceira nota',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mediaAluno,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 20), // espaçamento entre os botões
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
