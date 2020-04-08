import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'alerta.dart';

class Cadastro extends StatelessWidget {

  final nome = TextEditingController();
  final data = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: nome,
                style: TextStyle(
                  fontSize: 24.0 
                ),
                decoration: InputDecoration(
                  labelText: "Nome:",
                  icon: Icon(Icons.person)
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: data,
                style: TextStyle(
                  fontSize: 24.0 
                ),
                decoration: InputDecoration(
                  labelText: "Data de Nascimento:",
                  icon: Icon(Icons.calendar_today)
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: email,
                style: TextStyle(
                  fontSize: 24.0 
                ),
                decoration: InputDecoration(
                  labelText: "Email:",
                  icon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: password,
                obscureText: true,
                style: TextStyle(
                  fontSize: 24.0 
                ),
                decoration: InputDecoration(
                  labelText: "Senha:",
                  icon: Icon(Icons.vpn_key),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: password2,
                obscureText: true,
                style: TextStyle(
                  fontSize: 24.0 
                ),
                decoration: InputDecoration(
                  labelText: "Confirme a Senha:",
                  icon: Icon(Icons.vpn_key),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            RaisedButton(
              child: Text("Cadastrar",
                style: TextStyle(color: Colors.white, fontSize: 30.0)
              ),
              color: Colors.green,
              highlightColor: Colors.yellow[300],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    if (nome.text == null || nome.text.trim() == "")
                      return Alerta("Erro", "Preencha o nome.");

                    if (data.text == null || data.text.trim() == "")
                      return Alerta("Erro", "Preencha a data.");

                    if (email.text == null || email.text.trim() == "")
                      return Alerta("Erro", "Preencha o e-mail.");

                    if (password.text == null || password.text.trim() == "")
                      return Alerta("Erro", "Preencha a senha.");

                    if (password2.text != password.text)
                      return Alerta("Erro", "Confirmação de senha incorreta!");

                    return Login(nome.text, email.text, password.text);
                  }
                );
              },
            ),
          ]
        )
      )
    );
  }

}