import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'models/userModel.dart';

class Diagnostico extends StatefulWidget {

  final User _user;
  final int percentage;
  Diagnostico(this._user, this.percentage);

  /*bool _option1 = false;
  bool _option2 = false;
  bool _option3 = false;*/
  Color _color = Colors.green;
  Color _color2 = Colors.green[100];
  String _title = "Fique tranquilo(a)!";
  String _content = "Conteúdo";
  
  @override
  State<StatefulWidget> createState() {
    setVisibility();
    return Orientacao();
  }

  void setVisibility() {
    /*if(percentage < 33)   
      _option1 = true;
    else */if (percentage < 66) {
      _color = Colors.orange;
      _color2 = Colors.orange[100];
      _title = "Fique atento(a)!";
      //_option2 = true;
    }
    else {
      _color = Colors.red;
      _color2 = Colors.red[100];
      _title = "Mantenha a calma!";
      //_option3 = true;
    }
  }
}

class Orientacao extends State<Diagnostico> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Diagnóstico"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget._user)))
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    margin: EdgeInsets.only(top: 40, bottom: 40),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [widget._color, widget._color2]
                      ),
                      borderRadius: BorderRadius.circular(200)
                    ),
                    child: Center(
                      child: Text(
                        widget.percentage.toString() + "%",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [BoxShadow(
                            color: widget._color,
                            blurRadius: 4.0,
                            spreadRadius: 1.0,
                            offset: Offset(0,0),
                          )]
                        ),
                      ),
                    )
                  )
                ),
                Center(
                  child: Text(
                    widget._title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Padding (
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Center(
                    child: Text(
                      widget._content,
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                  )
                )
              ],
            )
          ),
        ],
      ),
    );
  }
}
