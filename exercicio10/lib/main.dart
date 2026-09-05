// exercicio 10 - controle de estoque
// Crie uma aplicação que mantenha a quantidade atual de um produto em estoque. O usuário informará uma quantidade e poderá registrar uma entrada ou uma saída

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
      home: TelaControleEstoque(),
    );
  }
}

class TelaControleEstoque extends StatefulWidget {
  const TelaControleEstoque({super.key});

  @override
  State<TelaControleEstoque> createState() => _TelaControleEstoque();
}

class _TelaControleEstoque extends State<TelaControleEstoque> {
  final TextEditingController quantidadeController = TextEditingController();

  String mensagem = '';
  int estoque = 0;

  void entrada() {
    int qtde = int.tryParse(quantidadeController.text) ?? 0;
    estoque = estoque + qtde;

    setState(() {
      mensagem = 'Entrada realizada com sucesso!';
    });
  }

  void saida() {
    int qtde = int.tryParse(quantidadeController.text) ?? 0;

    setState(() {
      if (qtde > estoque) {
        mensagem = 'Operação não pode ser realizada, quantidade a ser retirada maior do que está em estoque';
      } else {
        estoque = estoque - qtde;
        mensagem = 'Saída realizada com sucesso!';
      }
    });
  }

  void limparCampos() {
    quantidadeController.clear();
    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    quantidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Controle de Estoque')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Texto permanente com o valor do estoque
            Text(
              'Quantidade atual em estoque: $estoque',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantidadeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite a quantidade do produto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: entrada, child: Text('Entrada')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: saida, child: Text('Saída')),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: limparCampos,
                  child: Text('Limpar campo'),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(mensagem, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}