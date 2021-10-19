import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/components/CronometroBotao.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;

    final store = Provider.of<PomodoroStore>(context);
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          SizedBox(
            height: _deviceHeight * 0.02,
          ),
          Text(
            '${store.minutos.toString().padLeft(2, '0')}:${store.segundos.toString().padLeft(2, '0')}',
            style: TextStyle(fontSize: 120, color: Colors.white),
          ),
          SizedBox(
            height: _deviceHeight * 0.02,
          ),
          Observer(
            builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(!store.iniciado)
                Padding(
                  padding: EdgeInsets.only(right: _deviceWidth * 0.03),
                  child:
                      CronometroBotao(icone: Icons.play_arrow, texto: 'Iniciar', click: store.iniciarCronometro),
                ),
                if(store.iniciado)
                Padding(
                  padding: EdgeInsets.only(right: _deviceWidth * 0.03),
                  child: CronometroBotao(icone: Icons.stop, texto: 'Parar', click: store.pararCronometro),
                ),
                Padding(
                  padding: EdgeInsets.only(left: _deviceWidth * 0.03),
                  child:
                      CronometroBotao(icone: Icons.refresh, texto: 'Reiniciar', click: store.reiniciarCronometro),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
