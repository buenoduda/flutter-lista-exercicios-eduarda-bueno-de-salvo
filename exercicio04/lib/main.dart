// exercício 4 - conversor de temperatura
// Crie um aplicativo que receba uma temperatura em graus Celsius e faça a conversão para Fahrenheit.

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
      home: TelaTemperatura(),
    );
  }
}

class TelaTemperatura extends StatefulWidget {
  const TelaTemperatura({super.key});

  @override
  State<TelaTemperatura> createState() => _TelaTemperaturaState();
}

class _TelaTemperaturaState extends State<TelaTemperatura> {
  final TextEditingController celsiusController = TextEditingController();
  String resultado = '';

  void converter() {
    double celsius = double.tryParse(celsiusController.text) ?? 0;
    double fahrenheit = (celsius * 9 / 5) + 32;

    setState(() {
      resultado = 'Temperatura em Fahrenheit: $fahrenheit °F';
    });
  }

  void limparCampos() {
    celsiusController.clear();
    setState(() {
      resultado = '';
    });
  }

  @override
  void dispose() {
    celsiusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Conversor de Temperatura')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: celsiusController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Temperatura em Celsius (°C)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              //BOTÃO
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: converter, child: Text('Converter')),
                SizedBox(width: 20),
                ElevatedButton(onPressed: limparCampos, child: Text('Limpar')),
              ],
            ),
            SizedBox(height: 30),
            Text(resultado, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
