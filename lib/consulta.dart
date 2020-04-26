import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Consulta extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta")
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Marque os sintomas apresentados nos últimos 5 dias:"),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Febre")
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text("Tosse")
            ),
          ],
        ),
      ),
    );
  }
}