import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'util/alerta.dart';
import 'models/userModel.dart';
import 'home.dart';

class Login extends StatelessWidget {

  final User _user;
  Login(this._user);

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
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: email,
                style: TextStyle(
                  fontSize: 18 
                ),
                decoration: InputDecoration(
                  labelText: "Email:",
                  icon: Icon(Icons.email)
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: password,
                obscureText: true,
                style: TextStyle(
                  fontSize: 18 
                ),
                decoration: InputDecoration(
                  labelText: "Senha:",
                  icon: Icon(Icons.vpn_key),
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: RaisedButton(
                child: Text(
                  "Entrar",
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
                      return Home(new User("Nathália Lopes", "nathalialcoimbra@gmail.com", "18/04/1992", "SP", "São Paulo", "12345"));

                      /*if (email.text != _user.email || password.text != _user.senha)
                        return Alerta("Erro", "Login e/ou senha incorretos!");

                      return Home(_user);*/
                    }
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
              child: InkWell(
                child: Text(
                  "Cadastre-se",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()))
              ),
            ),
          ],
        ),
      ),
    );
  }
}