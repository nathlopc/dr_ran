import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'components/footer.dart';
import 'components/section.dart';
import 'data/firebase.dart';
import 'home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Login extends StatelessWidget {

  Login();

  String email;
  String senha;
  final GlobalKey<FormState> login = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(245, 245, 245, 1),
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
            Padding (
              padding: EdgeInsets.all(15),
              child: Column (
                children: <Widget> [
                  Section("Login"),
                  Form(
                    key: login,
                    child: Column(
                      children: <Widget>[
                        Padding (
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "E-mail"
                            ),
                            onSaved: (field) => email = field,
                            validator: (email) => email.isEmpty || email.trim().length == 0 ? 'Campo obrigatório' : null,
                          ),
                        ),
                        Padding (
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Senha"
                            ),
                            obscureText: true,
                            onSaved: (field) => senha = field,
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
                            padding: EdgeInsets.only(top: 50, bottom: 15),
                            child: SizedBox (
                              width: MediaQuery.of(context).size.width,
                              child: RaisedButton(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  "Entrar",
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
                                  if (login.currentState.validate()) {
                                    login.currentState.save();
                                    
                                    await FirebaseAPI().login(email, senha).then((value) {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(value)));
                                    })
                                    .catchError((erro) {
                                      Alert(
                                        context: context, 
                                        title: "Erro", 
                                        desc: erro.toString(),
                                        type: AlertType.error,
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(color: Colors.white, fontSize: 20),
                                            ),
                                            onPressed: () => Navigator.pop(context),
                                            width: 120,
                                          )
                                        ]
                                      ).show();
                                    });

                                  }
                                },
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
                                width: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    "Cadastre-se",
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
                                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()))
                                ),
                              )
                            )
                          )
                        )
                      ]
                    ),
                  )                  
                ]
              )
            ),
          ],
        )
      )
    );
  }
}