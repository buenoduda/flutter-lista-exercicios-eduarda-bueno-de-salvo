// Exercício 09 - Sistema Simples de Venda
// Crie uma aplicação que receba o nome de um produto, o preço unitário e a quantidade comprada. Calcule o subtotal e aplique desconto quando necessário.

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
      home: TelaSistemaSimplesVenda(),
    );
  }
}

class TelaSistemaSimplesVenda extends StatefulWidget {
  const TelaSistemaSimplesVenda({super.key});

  @override
  State<TelaSistemaSimplesVenda> createState() =>
      _TelaSistemaSimplesVendaState();
}

class _TelaSistemaSimplesVendaState extends State<TelaSistemaSimplesVenda> {
  final TextEditingController produtoController = TextEditingController();
  final TextEditingController precoController = TextEditingController();
  final TextEditingController quatidadeController = TextEditingController();

  String mensagem = '';

  void sistemaSimplesVenda() {
    String produto = produtoController.text;
    double preco =
        double.tryParse(precoController.text.replaceAll(',', '.')) ?? 0;
    double qtde =
        double.tryParse(quatidadeController.text.replaceAll(',', '.')) ?? 0;

    double subtotal = preco * qtde;
    double desconto = 0.0;
    //desconto de 10% somente se for superior a 500
    if (subtotal > 500) {
      desconto = subtotal * 0.10;
    } else {
      desconto = 0.0;
    }

    double total = subtotal - desconto;

    setState(() {
      mensagem =
          'Produto: $produto\n'
          'Quantidade: ${qtde.toInt()}\n'
          'Subtotal: R\$ ${subtotal.toStringAsFixed(2)}\n'
          'Desconto: R\$ ${desconto.toStringAsFixed(2)}\n'
          'Total: R\$ ${total.toStringAsFixed(2)}';
    });
  }

  void limparCampos() {
    produtoController.clear();
    precoController.clear();
    quatidadeController.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    produtoController.dispose();
    precoController.dispose();
    quatidadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sistema Simples de Venda')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: produtoController,
              decoration: InputDecoration(
                labelText: 'Nome do produto',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: precoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Preço Unitário do Produto (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: quatidadeController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Quantidade Comprada',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: sistemaSimplesVenda,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limparCampos, child: Text('Limpar')),
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
