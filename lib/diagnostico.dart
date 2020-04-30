import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'models/userModel.dart';
import 'hospitais.dart';

class Diagnostico extends StatefulWidget {

  final User _user;
  final int percentage;
  Diagnostico(this._user, this.percentage);

  bool _option1 = false;
  bool _option2 = false;
  bool _option3 = false;
  
  @override
  State<StatefulWidget> createState() {
    setVisibility();
    return Orientacao();
  }

  void setVisibility() {
    if (percentage < 33)
      _option1 = true;
    else if (percentage < 66)
      _option2 = true;
    else
      _option3 = true;
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
          Visibility(
            visible: widget._option1,
            child: Padding(
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
                          colors: [Colors.green, Colors.green[100]]
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
                              color: Colors.green,
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
                      "Fique tranquilo!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: Center(
                      child: Text(
                        "Pelos seus sintomas, provavelmente seu problema não passa de uma gripe comum.\n\nVerifique nos próximos dias o aparecimento de novos sintomas ou o agravamento dos que você já possui e refaça o teste.\n\nMesmo não se tratando de Covid-19, seu sistema imunológico está mais fraco.\n\nPreserve-se! Fique em casa!",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  )
                ],
              )
            )
          ),
          Visibility(
            visible: widget._option2,
            child: Padding(
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
                          colors: [Colors.orange, Colors.orange[100]]
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
                              color: Colors.orange,
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
                      "Fique atento(a)!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: Center(
                      child: Text(
                        "Pelos seus sintomas, existe alguma chance de você ter contraído Covid-19, mas seus sintomas são leves e podem ser tratados de casa.\n\nFique atento à sua condição de saúde, principalmente nos próximos 14 dias e volte a fazer o teste caso haja agravamento ou aparecimento de sintomas.\n\nAtenção redobrada à sua higiene e fique em casa!\n\nLembre-se de lavar as mãos com água e sabão (ou álcool em gel 70%), use máscara o tempo todo, mantenha uma distância mínima de 2 metros para as outras pessoas, não compartilhe objetos pessoais (talheres, copo, toalha de banho, roupa de cama).\n\nPreserve sua a saúde e das outras pessoas!",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  )
                ],
              )
            )
          ),
          Visibility(
            visible: widget._option3,
            child: Padding(
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
                          colors: [Colors.red, Colors.red[100]]
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
                              color: Colors.red,
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
                      "Mantenha a calma!",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding (
                    padding: EdgeInsets.only(top: 40, bottom: 40),
                    child: Center(
                      child: Text(
                        "Pelos seus sintomas, há chances altas de vocês ter contraído Covid-19.\n\nProcure o hospital mais próximo de você para um diagnóstico mais apurado.\n\nLembre-se de lavar bem as mãos com água e sabão antes de sair, colocar uma máscara no rosto e manter uma distância mínima de 1m para as outras pessoas para evitar contágio.\n\nConfira uma lista de hospitais para procurar ajuda médica:",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ),
                 /* Padding (
                    padding: EdgeInsets.all(0),
                    child: Container(
                      width: 500,
                      height: 70,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(85,153,255,1),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [BoxShadow(
                          color: Color.fromRGBO(85,153,255,0.5),
                          blurRadius: 4.0,
                          spreadRadius: 2.0,
                          offset: Offset(0,0),
                        )]
                      ),
                      child: InkWell (
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Hospitais()));
                        },
                        child: ListTile(
                          leading: Image(
                            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3QU9I70aLyrjoElpJS0OsG3l8FiMO4AwjpAlQRI0HCTWK95ui&usqp=CAU'),
                          ),
                          title: Text(
                            "Encontre um hospital",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ),
                  )*/
                ],
              )
            )
          ),
        ],
      ),
    );
  }
}
