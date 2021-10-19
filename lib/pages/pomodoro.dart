import 'package:flutter/material.dart';
import 'package:pomodoro/components/Cronometro.dart';
import 'package:pomodoro/components/EntradaTempo.dart';

class Pomodoro extends StatelessWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Cronometro(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: _deviceHeight * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(valor: 25, titulo: 'Trabalho'),
                EntradaTempo(valor: 5, titulo: 'Descanso')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
