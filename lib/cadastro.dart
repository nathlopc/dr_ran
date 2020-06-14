import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'login.dart';
import 'util/alerta.dart';
import 'models/userModel.dart';

class Cadastro extends StatefulWidget {

  final nome = TextEditingController();
  final data = TextEditingController();
  final email = TextEditingController();
  String sexo = "";  
  double size = 18;
  final password = TextEditingController();
  final password2 = TextEditingController();
  final estado = TextEditingController();
  final cidade = TextEditingController();

  var maskDate = new MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});

  @override
  State<StatefulWidget> createState() {
    return Formulario();
  }
}

class Formulario extends State<Cadastro> {

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
                controller: widget.nome,
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
                controller: widget.data,
                style: TextStyle(
                  fontSize: 18 
                ),
                decoration: InputDecoration(
                  labelText: "Data de Nascimento:",
                  icon: Icon(Icons.calendar_today)
                ),
                keyboardType: TextInputType.datetime,
                inputFormatters: [widget.maskDate],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, left: 60),
              child: Row (
                children: <Widget>[
                  Text(
                    "Sexo:",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: widget.size
                    ),
                  ),
                ]
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 190,
                    child: ListTile (
                      leading: Radio(
                        value: 'M',
                        groupValue: widget.sexo,
                        onChanged: (String _sexo) {
                          setState(() {
                            widget.sexo = _sexo;
                            widget.size = 12;
                          });
                        },
                      ),
                      title: Text(
                        "Masculino",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
                    child: ListTile(
                      leading: Radio(
                        value: 'F',
                        groupValue: widget.sexo,
                        onChanged: (String _sexo) {
                          setState(() {
                            widget.sexo = _sexo;
                            widget.size = 12;
                          });
                        },
                      ),
                      title: Text(
                        "Feminino",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54
                        ),  
                      )
                    )
                  )
                ]
              )
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: widget.email,
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
                controller: widget.estado,
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
                controller: widget.cidade,
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
                controller: widget.password,
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
                controller: widget.password2,
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
                      debugPrint('sexo: ' + widget.sexo);

                      if (widget.nome.text == null || widget.nome.text.trim() == "")
                        return Alerta("Erro", "Preencha o nome.");

                      if (widget.data.text == null || widget.data.text.trim() == "")
                        return Alerta("Erro", "Preencha a data.");

                      if (widget.sexo == null || widget.sexo == "")
                        return Alerta("Erro", "Selecione o sexo.");

                      if (widget.email.text == null || widget.email.text.trim() == "")
                        return Alerta("Erro", "Preencha o e-mail.");

                      if (widget.estado.text == null || widget.estado.text.trim() == "")
                        return Alerta("Erro", "Preencha o estado.");

                      if (widget.cidade.text == null || widget.cidade.text.trim() == "")
                        return Alerta("Erro", "Preencha a cidade.");

                      if (widget.password.text == null || widget.password.text.trim() == "")
                        return Alerta("Erro", "Preencha a senha.");

                      if (widget.password2.text != widget.password.text)
                        return Alerta("Erro", "Confirmação de senha incorreta!");

                      final user = new User(widget.nome.text, widget.email.text, widget.data.text, widget.sexo, widget.estado.text, widget.cidade.text, widget.password.text);

                      return Login();
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