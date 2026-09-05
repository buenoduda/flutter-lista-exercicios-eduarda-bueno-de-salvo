// exercício 2 - verificador de idade
// Crie uma aplicação que receba o nome e a idade de uma pessoa e informe se ela é maior ou menor de idade.

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
      home: TelaVerificarIdade(),
    );
  }
}

class TelaVerificarIdade extends StatefulWidget {
  const TelaVerificarIdade({super.key});

  @override
  State<TelaVerificarIdade> createState() => _TelaVerificarIdadeState();
}

class _TelaVerificarIdadeState extends State<TelaVerificarIdade> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  String mensagem = '';

  void validarIdade() {
    String nome = nomeController.text;
    int idade = int.tryParse(idadeController.text) ?? 0; // precisamos converter para int pois o TextField retorna os dados em formato de texto

    if (idade >= 18) {
      setState(() {
        mensagem = '$nome é maior de idade.';
      });
    } else {
      setState(() {
        mensagem = '$nome é menor de idade.';
      });
    }
  }

  void limparCampos() {
    // redefine o valor das variáveis
    nomeController.clear();
    idadeController.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    // destruição de memória
    nomeController.dispose();
    idadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mostrar Dados')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: idadeController,
              decoration: InputDecoration(
                labelText: 'Idade',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: validarIdade, child: Text('Verificar')),
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
