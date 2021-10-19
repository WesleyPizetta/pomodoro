import 'package:flutter/material.dart';
import 'package:pomodoro/components/CronometroBotao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          SizedBox(height: _deviceHeight * 0.02,),
          Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white
            ),
          ),
          SizedBox(height: _deviceHeight * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: _deviceWidth * 0.03),
                child: CronometroBotao(icone: Icons.play_arrow, texto: 'Iniciar'),
              ),
              //Padding(
                //padding: EdgeInsets.only(right: _deviceWidth * 0.03),
                //child: CronometroBotao(icone: Icons.stop, texto: 'Parar'),
              //),
              Padding(
                padding: EdgeInsets.only(left: _deviceWidth * 0.03),
                child: CronometroBotao(icone: Icons.refresh, texto: 'Reiniciar'),
              )
            ],
          )
        ],
      ),
    );
  }
}
