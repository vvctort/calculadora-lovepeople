import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String display = '';
  String operador = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),
      body: Column(
        children: [
          _buildDisplay(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      height: 100,
      width: 400,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Text(
        display,
        style: const TextStyle(color: Colors.white, fontSize: 40),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButtons('7'),
            buildButtons('8'),
            buildButtons('9'),
            buildButtons('/'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButtons('4'),
            buildButtons('5'),
            buildButtons('6'),
            buildButtons('*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButtons('1'),
            buildButtons('2'),
            buildButtons('3'),
            buildButtons('-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButtons('C'),
            buildButtons('0'),
            buildButtons('='),
            buildButtons('+'),
          ],
        ),
      ],
    );
  }

  Widget buildButtons(String text) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 60,
      width: 60,
      child: ElevatedButton(
        onPressed: () {
          if (text == 'C') {
            clearDisplay();
          } else if (text == '=') {
            calcutate();
          } else {
            addInDisplay(text);
          }
          if (text == '+' || text == '-' || text == '/' || text == '*') {
            operador = text;
          }
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void clearDisplay() {
    setState(() {
      display = '';
    });
  }

  void calcutate() {
    List<String> valores = display.split(operador);
    if (operador == '+') {
      double resultado = double.parse(valores[0]) + double.parse(valores[1]);
      setState(() {
        display = resultado.toString();
      });
    }
    if (operador == '-') {
      double resultado = double.parse(valores[0]) - double.parse(valores[1]);
      setState(() {
        display = resultado.toString();
      });
    }
    if (operador == '/') {
      double resultado = double.parse(valores[0]) / double.parse(valores[1]);
      setState(() {
        display = resultado.toString();
      });
    }
    if (operador == '*') {
      double resultado = double.parse(valores[0]) * double.parse(valores[1]);
      setState(() {
        display = resultado.toString();
      });
    }
  }

  void addInDisplay(String text) {
    setState(() {
      display += text;
    });
  }
}
//comentario adicionado!
