// Exercício 08 - Consumo de combustível
// Crie uma aplicação que receba a distância percorrida e a quantidade de combustível utilizada. Calcule o consumo médio do veículo.

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
      home: TelaConsumoCombustivel(),
    );
  }
}

class TelaConsumoCombustivel extends StatefulWidget {
  const TelaConsumoCombustivel({super.key});

  @override
  State<TelaConsumoCombustivel> createState() => _TelaConsumoCombustivelState();
}

class _TelaConsumoCombustivelState extends State<TelaConsumoCombustivel> {
  final TextEditingController distanciaController = TextEditingController();
  final TextEditingController combustivelController = TextEditingController();

  String mensagem = '';

  void consumoCombustivel() {
    double distancia =
        double.tryParse(distanciaController.text.replaceAll(',', '.')) ?? 0;
    double combustivel =
        double.tryParse(combustivelController.text.replaceAll(',', '.')) ?? 0;

    setState(() {
      if (combustivel > 0) {
        double consumo = distancia / combustivel;
        String classificacao =
          consumo >= 12 ? 'Econômico' : 'Consumo Elevado';
          //condição ? valor se verdadeiro : valor se falso

        mensagem =
          'Consumo médio: ${consumo.toStringAsFixed(1)} km/l\n'
          'Classificação: $classificacao';
      } else {
        mensagem = 'Informe uma quantidade de combustível válida e maior que zero.';
      }
    });
  }

  void limparCampos() {
    distanciaController.clear();
    combustivelController.clear();

    setState(() {
      mensagem = '';
    });
  }

  @override
  void dispose() {
    distanciaController.dispose();
    combustivelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consumo de Combustível')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: distanciaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Distância percorrida (km)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: combustivelController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Combustível utilizado (litros)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: consumoCombustivel,
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