import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pomodoro/store/pomodoro.store.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;

  const EntradaTempo({
    Key? key,
    required this.valor,
    required this.titulo,
    this.inc,
    this.dec
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    final store = Provider.of<PomodoroStore>(context);

    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(this.titulo, style: TextStyle(
              fontSize: 25
          ),),
          SizedBox(height: _deviceHeight * 0.02,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: this.dec,
                  child: Icon(
                      Icons.arrow_downward,
                      color: Colors.white
                  ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(_deviceHeight * 0.01),
                  primary: store.estaTrabalhando() ? Colors.red : Colors.green,
                ),
              ),
              Text('${this.valor} min.', style: TextStyle(
                fontSize: 18
              ),),
              ElevatedButton(
                onPressed: this.inc,
                child: Icon(
                    Icons.arrow_upward,
                    color: Colors.white
                ),
                style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(_deviceHeight * 0.01),
                    primary: store.estaTrabalhando() ? Colors.red : Colors.green
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
