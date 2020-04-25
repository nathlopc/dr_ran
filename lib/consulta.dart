import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Consulta extends StatelessWidget {

  bool febre = false;
  bool tosse = false;

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
              child: CheckboxListTile(
                value: febre,
                title: Text("Febre"),
                onChanged: (bool value) { 
                  febre = value;
                },
              )
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CheckboxListTile(
                value: tosse,
                title: Text("Tosse"),
                onChanged: (bool value) { 
                  tosse = value;
                },
              )
            ),
          ],
        ),
      ),
    );
  }
}