import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'login.dart';
import 'models/userModel.dart';
import 'data/ibge.dart';
import 'components/footer.dart';
import 'components/section.dart';
import 'data/firebase.dart';

class Cadastro extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Formulario();
  }
}

class Formulario extends State<Cadastro> {

  String nome, email, data, senha, senha2, estado, cidade, sexo;
  var maskDate = new MaskTextInputFormatter(mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
  final cadastro = GlobalKey<FormState>();
  
  List<String> estados = new List();
  List<String> cidades = new List();
  List<String> sexos = new List();

  @override
  void initState() {
    super.initState();
    _getEstados();
    _getSexos();
  }

  void _getSexos() {
    setState(() {
      sexos = ['Feminino', 'Masculino'];
      sexo = sexos[0];
    });
  }

  void _getEstados() async {
    var result = await IBGEAPI().getEstados();
    setState(() {
      estados = result;
      estados.sort((a, b) => a.toString().compareTo(b.toString()));
      if (estados.length > 0)
      {
        estado = estados[0];
        _getCidades();
      }
    });
  }

  void _getCidades() async {
    var result = await IBGEAPI().getCidades(estado);
    setState(() {
      cidades = result;
      if (cidades.length > 0)
        cidade = cidades[0];
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(51, 51, 51, 1)
        ),
      ),
      bottomSheet: Footer(),
      body: SingleChildScrollView(
       child: Column (
          children: <Widget>[
            Stack (
              children: <Widget>[
                Positioned (
                  width: MediaQuery.of(context).size.width,
                  top: 10,
                  left: 30,
                  child: Text(
                    "dr. ran",
                    style: TextStyle(
                      fontFamily: "BradleyHandITC",
                      fontSize: 50
                    ),
                  ),
                ),
                Padding (
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                  child: Image(
                    image: AssetImage('assets/images/frog2.png'),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Section("Cadastro")
            ),
            Form(
              key: cadastro,
              child: Column(
                children: <Widget>[
                  Padding (
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Nome"
                      ),
                      onSaved: (field) => nome = field.trim().toString(),
                      validator: (nome) => nome.isEmpty || nome.trim().length == 0 ? 'Campo obrigatório' : null,
                    ),
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Data de Nascimento (DD/MM/AAAA)"
                      ),
                      inputFormatters: [maskDate],
                      onSaved: (field) => data = field,
                      validator: (data) => data.isEmpty || data.trim().length == 0 ? 'Campo obrigatório' : null,
                    ),
                  ),  
                  Padding (
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: 'Selecione...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                      ),
                      isEmpty: sexo == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: sexo,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              sexo = value;
                            });
                          },
                          items: <String>['Masculino', 'Feminino'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    )
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: 'Selecione...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                      ),
                      isEmpty: estado == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: estado,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              estado = value;
                              cidades = new List<String>();
                              _getCidades();
                            });
                          },
                          items: estados.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    )
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
                        hintText: 'Selecione...',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))
                      ),
                      isEmpty: cidade == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: cidade,
                          isDense: true,
                          onChanged: (String value) {
                            setState(() {
                              cidade = value;
                            });
                          },
                          items: cidades.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )
                    )
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "E-mail"
                      ),
                      onSaved: (field) => email = field.trim().toString(),
                      validator: (email) {
                        if (email.isEmpty || email.trim().length == 0)
                          return 'Campo obrigatório';
                        
                        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.trim()))
                          return 'E-mail inválido';

                        return null;
                      }
                    ),
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Senha"
                      ),
                      obscureText: true,
                      onSaved: (field) => senha = field.trim().toString(),
                      validator: (senha) {
                        if (senha.isEmpty || senha.trim().length == 0)
                          return "Campo obrigatório";

                        if (senha.length < 6)
                          return "Senha deve ter no mínimo 6 caracteres";

                        return null;
                      }
                    ),
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
                            "Cadastrar",
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
                          onPressed: () async {
                            if (cadastro.currentState.validate()) {
                              cadastro.currentState.save();
                              
                              var user = new User(nome: nome, email: email, data: data, cidade: cidade, estado: estado, senha: senha, sexo: sexo);
                              
                              await FirebaseAPI().insertUser(user).then((sucesso) {
                                cadastro.currentState.reset();

                                Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                              });
                            }
                          }
                        ),
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: SizedBox (
                          width: MediaQuery.of(context).size.width - 80,
                          child: RaisedButton(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                            color: Color.fromRGBO(245, 245, 245, 1),
                            textColor: Color.fromRGBO(255, 192, 0, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 192, 0, 1)
                              )
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login()))
                          ),
                        )
                      )
                    )
                  )
                ]
              ),
            )
          ],
        )
      )
    );
  }

}