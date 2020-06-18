import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/userModel.dart';
import 'diagnostico.dart';
import 'components/menuBar.dart';
import 'components/section.dart';

class Consulta extends StatefulWidget {

  final User user;
  Consulta(this.user);

  @override
  State<StatefulWidget> createState() {
    return NewConsulta();
  }
}

class NewConsulta extends State<Consulta> {

  bool _contato = false;
  bool _cabeca = false;
  bool _coriza = false;
  bool _tosse = false;
  bool _garganta = false;
  bool _respirar = false;
  bool _dor = false;
  bool _diarreia = false;
  bool _febre = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 350,
              right: 0,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/frog3.png")
                  )
                ),
              )
            ),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Section("Sintomas")
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Tive contato com alguém diagnosticado com COVID-19"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _contato = resp;
                        });
                      },
                      value: _contato,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Dor de Cabeça"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _cabeca = resp;
                        });
                      },
                      value: _cabeca,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Coriza / Espirro"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _coriza = resp;
                        });
                      },
                      value: _coriza,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Tosse Seca"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _tosse = resp;
                        });
                      },
                      value: _tosse,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Dor de Garganta"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _garganta = resp;
                        });
                      },
                      value: _garganta,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Dificuldade para Respirar"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _respirar = resp;
                        });
                      },
                      value: _respirar,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Dor no Corpo"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _dor = resp;
                        });
                      },
                      value: _dor,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
                    child: CheckboxListTile(
                      title: Text("Diarreia"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _diarreia = resp;
                        });
                      },
                      value: _diarreia,
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 40),
                    child: CheckboxListTile(
                      title: Text("Febre"),
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (bool resp) {
                        setState(() {
                          _febre = resp;
                        });
                      },
                      value: _febre,
                    )
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: SizedBox (
                        width: MediaQuery.of(context).size.width - 80,
                        child: RaisedButton(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Diagnosticar",
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                          color: Color.fromRGBO(245, 245, 245, 1),
                          textColor: Color.fromRGBO(112, 173, 71, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(
                              color: Color.fromRGBO(112, 173, 71, 1)
                            )
                          ),
                          onPressed: () {
                            int total = 1;
                            if (_contato) total += 10;
                            if (_cabeca) total += 1;
                            if (_febre) total += 5;
                            if (_coriza) total += 1;
                            if (_tosse) total += 3;
                            if (_garganta) total += 1;
                            if (_respirar) total += 10;
                            if (_dor) total += 1;
                            if (_diarreia) total += 1;
                            if (total > 10) total += 1;
                            if (total > 21) total += 2;
                            double percentage = (total * 100 / 40);
                            _contato = false;
                            _cabeca = false;
                            _coriza = false;
                            _tosse = false;
                            _garganta = false;
                            _respirar = false;
                            _dor = false;
                            _diarreia = false;
                            _febre = false;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Diagnostico(widget.user, percentage)));
                          },
                        ),
                      )
                    )
                  )
                ],
              ),
            )
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