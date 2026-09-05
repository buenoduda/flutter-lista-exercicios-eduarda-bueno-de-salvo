// exercício 3 - antecessor e sucessor
// Peça ao usuário um número inteiro. Ao pressionar Calcular, mostre o número informado, seu antecessor e seu sucessor.

import 'package:flutter/material.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: TelaAntSuc());
  }
}

class TelaAntSuc extends StatefulWidget {
  const TelaAntSuc({super.key});

  @override
  State<TelaAntSuc> createState() => _TelaAntSucState();
}

class _TelaAntSucState extends State<TelaAntSuc> {
  final TextEditingController numeroController = TextEditingController();

  String mensagem = '';

  void validarNumeros() {
    int numero = int.tryParse(numeroController.text) ?? 0;
    int antecessor = (numero - 1);
    int sucessor = (numero + 1);

    setState(() {
      mensagem = 'Número: $numero \nAntecessor: $antecessor \nSucessor: $sucessor';
    });
  }

  void limparCampos() {
    // redefine o valor das variáveis
    numeroController.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    // destruição de memória
    numeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verificador de Antecessor e Sucessor')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Insira um número',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: validarNumeros,
                  child: Text('Calcular'),
                ),
                SizedBox(width: 20), // espaçamento entre os botões
                ElevatedButton(
                  onPressed: limparCampos, 
                  child: Text('Limpar')),
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
