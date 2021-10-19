import 'package:flutter/material.dart';
import 'package:pomodoro/components/EntradaTempo.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Pomodoro'),
          EntradaTempo(valor: 25, titulo: 'Trabalho'),
          EntradaTempo(valor: 5, titulo: 'Descanso')
        ],
      ),
    );
  }
}
