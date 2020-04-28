import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Consulta extends StatefulWidget {

   @override
  State<StatefulWidget> createState() {
    return NewConsulta();
  }
}

class NewConsulta extends State<Consulta> {

  bool _febre = false;
  bool _tosse = false;

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
                title: Text("Febre"),
                onChanged: (bool resp) {
                  setState(() {
                    _febre = resp;
                  });
                },
                value: _febre,
              )
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CheckboxListTile(
                title: Text("Tosse"),
                onChanged: (bool resp) {
                  setState(() {
                    _tosse = resp;
                  });
                },
                value: _tosse
              )
            ),
          ],
        ),
      ),
    );
  }

}