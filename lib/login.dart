import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'alerta.dart';
import 'home.dart';

class Login extends StatelessWidget {

  final String _nome;
  final String _email;
  final String _password;

  Login(this._nome, this._email, this._password);

  final nome = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: <Widget>[
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
            RaisedButton(
              child: Text("Entrar",
                style: TextStyle(color: Colors.white, fontSize: 30.0)
              ),
              color: Colors.green,
              highlightColor: Colors.yellow[300],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Home("Nathália Lopes", "nathalialcoimbra@gmail.com");

                    /*if (email.text != _email || password.text != _password)
                      return Alerta("Erro", "Login e/ou senha incorretos!");

                    return Home(_nome, _email);*/
                  }
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: InkWell(
                child: Text("Cadastre-se"),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()))
              ),
            ),
          ],
        ),
      ),
    );
  }
}