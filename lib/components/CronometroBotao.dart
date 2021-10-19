import 'package:flutter/material.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotao({
    Key? key,
    required this.icone,
    required this.texto,
    this.click
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    double _deviceHeight = MediaQuery.of(context).size.height;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.07,
          vertical: _deviceHeight * 0.01
        ),
        textStyle: TextStyle(
          fontSize: 15
        )
      ),
        onPressed: click,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: _deviceWidth * 0.02),
              child: Icon(
                icone,
              ),
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
