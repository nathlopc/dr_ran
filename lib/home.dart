import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  final String _nome;

  Home(this._nome);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: <Widget>[
            Text("Olá, " + _nome)
          ]
        )
      ),
    );
  }
}