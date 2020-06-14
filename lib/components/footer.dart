import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row (
      children: <Widget> [
        Expanded (
          child: Container (
            alignment: Alignment.bottomLeft,
            height: 30,
            color: Color.fromRGBO(255, 192, 0, 1),
          )
        ),
        Expanded (
          child: Container (
            alignment: Alignment.bottomCenter,
            height: 30,
            color: Color.fromRGBO(112, 173, 71, 1),
          )
        ),
        Expanded (
          child: Container (
            alignment: Alignment.bottomLeft,
            height: 30,
            color: Color.fromRGBO(68, 114, 196, 1),
          )
        ),
      ]
    );
  }
}