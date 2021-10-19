import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;

  const CronometroBotao({
    Key? key,
    required this.icone,
    required this.texto
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
        ),
        textStyle: TextStyle(
          fontSize: 15
        )
      ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              icone,
            ),
            Text(
              texto,
              style: TextStyle(),
            )
          ],
        )
    );
  }
}
