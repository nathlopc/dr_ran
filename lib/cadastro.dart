import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'login.dart';
import 'util/alerta.dart';
import 'models/userModel.dart';

class Cadastro extends StatelessWidget {

  final nome = TextEditingController();
  final data = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  final estado = TextEditingController();
  final cidade = TextEditingController();

  var maskDate = new MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

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
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: nome,
                style: TextStyle(
                  fontSize: 18
                ),
                decoration: InputDecoration(
                  labelText: "Nome:",
                  icon: Icon(Icons.person)
                ),
                keyboardType: TextInputType.text,
                maxLength: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: data,
                style: TextStyle(
                  fontSize: 18 
                ),
                decoration: InputDecoration(
                  labelText: "Data de Nascimento:",
                  icon: Icon(Icons.calendar_today)
                ),
                keyboardType: TextInputType.datetime,
                inputFormatters: [maskDate],
              ),
            ),
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
                maxLength: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: estado,
                style: TextStyle(
                  fontSize: 18 
                ),
                decoration: InputDecoration(
                  labelText: "Estado:",
                  icon: Icon(Icons.location_on)
                ),
                keyboardType: TextInputType.text,
                maxLength: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: cidade,
                style: TextStyle(
                  fontSize: 18
                ),
                decoration: InputDecoration(
                  labelText: "Cidade:",
                  icon: Icon(Icons.location_city)
                ),
                keyboardType: TextInputType.text,
                maxLength: 30,
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
                maxLength: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: password2,
                obscureText: true,
                style: TextStyle(
                  fontSize: 18 
                ),
                decoration: InputDecoration(
                  labelText: "Confirme a Senha:",
                  icon: Icon(Icons.vpn_key),
                ),
                keyboardType: TextInputType.visiblePassword,
                maxLength: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: RaisedButton(
                child: Text(
                  "Cadastrar",
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
                      debugPrint(data.text);
                      debugPrint(maskDate.getMaskedText());

                      if (nome.text == null || nome.text.trim() == "")
                        return Alerta("Erro", "Preencha o nome.");

                      if (data.text == null || data.text.trim() == "")
                        return Alerta("Erro", "Preencha a data.");

                      if (email.text == null || email.text.trim() == "")
                        return Alerta("Erro", "Preencha o e-mail.");

                      if (estado.text == null || estado.text.trim() == "")
                        return Alerta("Erro", "Preencha o estado.");

                      if (cidade.text == null || cidade.text.trim() == "")
                        return Alerta("Erro", "Preencha a cidade.");

                      if (password.text == null || password.text.trim() == "")
                        return Alerta("Erro", "Preencha a senha.");

                      if (password2.text != password.text)
                        return Alerta("Erro", "Confirmação de senha incorreta!");

                      final user = new User(nome.text, email.text, data.text, estado.text, cidade.text, password.text);

                      return Login(user);
                    }
                  );
                },
              ),
            )
          ]
        )
      )
    );
  }

}