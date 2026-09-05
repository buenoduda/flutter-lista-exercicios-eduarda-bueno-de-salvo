// exercício 1 - identificação do usuário
//Crie um aplicativo que solicite o nome e a cidade do usuário. Ao pressionar o botão Mostrar, a aplicaçãodeverá montar uma frase com os dados informados.

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
      home: TelaIdenUsuario(),
    );
  }
}

class TelaIdenUsuario extends StatefulWidget {
  const TelaIdenUsuario({super.key});

  @override
  State<TelaIdenUsuario> createState() => _TelaIdenUsuarioState();
}

class _TelaIdenUsuarioState extends State<TelaIdenUsuario> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  String mensagem = '';

  void mostrarDados() {
    String nome = nomeController.text;
    String cidade = cidadeController.text;
    setState(() {
      mensagem = 'Olá, $nome! Você mora em $cidade.';
    });
  }

  void limparCampos() {
    // redefine o valor das variáveis
    nomeController.clear();
    cidadeController.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    // destruição de memória
    nomeController.dispose();
    cidadeController.dispose();
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
              controller: cidadeController,
              decoration: InputDecoration(
                labelText: 'Cidade',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: mostrarDados, 
                  child: Text('Mostrar'),
                  ),
                SizedBox(width: 20), // espaçamento entre os botões
                ElevatedButton(
                  onPressed: limparCampos, 
                  child: Text('Limpar'),
                ),
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
