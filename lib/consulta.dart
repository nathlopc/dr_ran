import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'util/alerta.dart';
import 'models/userModel.dart';
import 'diagnostico.dart';

class Consulta extends StatefulWidget {

  final User user;
  Consulta(this.user);

  @override
  State<StatefulWidget> createState() {
    return NewConsulta();
  }
}

class NewConsulta extends State<Consulta> {

  bool _febre = false;
  var _febreValue = new TextEditingController();
  bool _tosse = false;
  bool _coriza = false;
  bool _garganta = false;
  bool _respirar = false;

  bool _diabetes = false;
  bool _cardiaco = false;
  bool _respiratorio = false;
  bool _naopossui = false;

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
              padding: const EdgeInsets.all(20),
              child: Text(
                "Marque os sintomas apresentados nos últimos 5 dias:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Febre"),
                onChanged: (bool resp) {
                  setState(() {
                    _febre = resp;
                    if (!_febre) _febreValue.clear();
                  });
                },
                value: _febre,
              )
            ),
            Visibility(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                child: TextField(
                  controller: _febreValue,
                  style: TextStyle(
                    fontSize: 24.0 
                  ),
                  decoration: InputDecoration(
                    labelText: "Última temperatura:",
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                ),
              ),
              visible: _febre,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
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
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Coriza"),
                onChanged: (bool resp) {
                  setState(() {
                    _coriza = resp;
                  });
                },
                value: _coriza
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Dor de Garganta"),
                onChanged: (bool resp) {
                  setState(() {
                    _garganta = resp;
                  });
                },
                value: _garganta
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Dificuldade para Respirar"),
                onChanged: (bool resp) {
                  setState(() {
                    _respirar = resp;
                  });
                },
                value: _respirar
              )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "Marque as doenças crônicas que possui:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Diabetes"),
                onChanged: (bool resp) {
                  setState(() {
                    _diabetes = resp;
                    _naopossui = false;
                  });
                },
                value: _diabetes,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Doença cardiovascular"),
                subtitle: Text("(pressão alta/hipertensão)"),
                onChanged: (bool resp) {
                  setState(() {
                    _cardiaco = resp;
                    _naopossui = false;
                  });
                },
                value: _cardiaco,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Doença respiratória"),
                subtitle: Text("(Asma, bronquite)"),
                onChanged: (bool resp) {
                  setState(() {
                    _respiratorio = resp;
                    _naopossui = false;
                  });
                },
                value: _respiratorio,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: CheckboxListTile(
                title: Text("Não possuo"),
                onChanged: (bool resp) {
                  setState(() {
                    _naopossui = resp;
                    _respiratorio = false;
                    _cardiaco = false;
                    _diabetes = false;
                  });
                },
                value: _naopossui,
              )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                child: Text(
                  "Mostrar Diagnóstico",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  )
                ),
                color: Colors.green,
                textColor: Colors.white,
                padding: EdgeInsets.all(10),
                highlightColor: Colors.yellow[300],
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      if (_febre == false &&
                          _tosse == false &&
                          _coriza == false &&
                          _garganta == false &&
                          _respirar == false)
                        return Alerta("Erro", "Marque ao menos um sintoma");

                      if (_diabetes == false &&
                          _cardiaco == false && 
                          _respiratorio == false && 
                          _naopossui == false)
                        return Alerta("Erro", "Marque ao menos um opção de doença crônica");

                      if (_febre == true && (_febreValue.text == null || _febreValue.text == ''))
                        return Alerta("Erro", "Preencha o valor da sua última temperatura");
                      
                      int percentage = 28;

                      if (_respirar)
                      {
                        percentage = 54;
                        int idade = getIdade(widget.user.data);
                        if (!_naopossui || idade > 60)
                          percentage = 76;
                      }

                      return Diagnostico(widget.user, percentage);
                    }
                  );
                },
              )
            ),
          ],
        ),
      ),
    );
  }

  int getIdade(String date) {
    final List<String> dates = date.split("/");
    return (2020 - int.parse(dates[2]));
  }

}