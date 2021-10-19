import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;

  const EntradaTempo({
    Key? key,
    required this.valor,
    required this.titulo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return Column(
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
                onPressed: () {},
                child: Icon(
                    Icons.arrow_downward,
                    color: Colors.white
                ),
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(_deviceHeight * 0.01),
                primary: Colors.red
              ),
            ),
            Text('${this.valor} min.', style: TextStyle(
              fontSize: 18
            ),),
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                  Icons.arrow_upward,
                  color: Colors.white
              ),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(_deviceHeight * 0.01),
                  primary: Colors.red
              ),
            )
          ],
        )
      ],
    );
  }
}
