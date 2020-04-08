import 'package:flutter/material.dart';

class Alerta extends StatelessWidget {

  final String _title;
  final String _message;

  Alerta(this._title, this._message);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('$_title'),
      content: Text('$_message'),
      actions: <Widget>[
        FlatButton(
          child: new Text("Fechar"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}