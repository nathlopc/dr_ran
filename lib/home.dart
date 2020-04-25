import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'news.dart';
import 'consulta.dart';
import 'models/userModel.dart';
import 'hospitais.dart';

class Home extends StatelessWidget {

  final User _user;
  Home(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column (
          children: <Widget>[
            
          ]
        )
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(_user.nome), 
              accountEmail: Text(_user.email),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: new NetworkImage('https://img.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg?size=338&ext=jpg'),
              ),
            ),
            new ListTile(
              title: Text("Notícias Covid-19"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => News()));
              },
            ),
            new ListTile(
              title: Text("Consulta"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Consulta()));
              },
            ),
            new ListTile(
              title: Text("Hospitais"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Hospitais()));
              },
            ),
            new Divider(),
            new ListTile(
              title: Text("Sair"),
              onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => Main()))
            )
          ]
        )
      )
    );
  }
}