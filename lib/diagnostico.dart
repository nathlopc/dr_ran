import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'models/userModel.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'hospitais.dart';
import 'components/banner.dart';
import 'components/section.dart';
import 'news.dart';

class Diagnostico extends StatefulWidget {

  final User _user;
  final double _percentage;
  final GlobalKey<AnimatedCircularChartState> _chart = new GlobalKey<AnimatedCircularChartState>();
  final List<CircularStackEntry> _data = new List();
  Color _color;
  String _title = "Erro";
  String _text = "Erro ao realizar diagnóstico";
  String _banner = "Guia";
  Color _color1;
  Color _color2;
  String _image;
  Widget _redirect;

  void main() {
    _data.add(
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(_percentage, _color)
        ],
        rankKey: 'Diagnóstico'
      )
    );
  }
  
  Diagnostico(this._user, this._percentage);

  @override
  State<StatefulWidget> createState() {
    setVisibility();
    main();
    return Orientacao();
  }

  void setVisibility() {
    if (_percentage <= 25)
    {
      _color = Color.fromRGBO(68, 114, 196, 1);
      _title = "Fique tranquilo(a)!";
      _text = "Pelos seus sintomas, provavelmente seu problema não passa de uma gripe comum.\n\nVerifique nos próximos dias o aparecimento de novos sintomas e/ou o agravamento dos sintomas que você já possui e refaça o teste.\n\nPreserve-se e fique em casa!";
      _banner = "Notícias";
      _image = "assets/images/news.png";
      _redirect = News(_user);
      _color1 = Color.fromRGBO(210, 147, 36, 1);
      _color2 = Color.fromRGBO(0, 166, 144, 1);
    }
    else if (_percentage > 25 && _percentage <= 52.5)
    {
      _color = Color.fromRGBO(255, 192, 0, 1);
      _title = "Fique atento(a)!";
      _text = "No momento seus sintomas são leves e podem ser tratados em casa. É importante, no entanto, que você fique isolado pelos próximos 15 dias e mantenha as regras de higiene.\n\n\Fique atento ao surgimento de novos sintomas e/ou o agravamento dos que você já possui. Refaça o teste caso isso ocorra.";
      _banner = "Guia";
      _image = "assets/images/guide.png";
      _redirect = Home(_user);
      _color1 = Color.fromRGBO(241, 90, 36, 1);
      _color2 = Color.fromRGBO(175, 18, 82, 1);
    }
    else
    {
      _color = Colors.red;
      _title = "Fique calmo(a)!";
      _text = "Mantenha a calma e procure o hospital mais próximo de você para obter um diagnóstico mais apurado.\n\nLembre-se de lavar bem as mãos com água e sabão antes de sair, colocar corretamente a máscara e manter uma distância mínima de 1.5 metros das pessoas, para evitar contágio.";
      _banner = "Hospitais";
      _image = "assets/images/hospital.png";
      _redirect = Hospitais();
      _color1 = Color.fromRGBO(156, 114, 73, 1);
      _color2 = Colors.red;
    }
  }
}

class Orientacao extends State<Diagnostico> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "dr. ran",
            style: TextStyle(
              fontFamily: 'BradleyHandITC',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          )
        ),
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(widget._user)))
          ),
        ],
      ),
      bottomSheet: LinkBanner(widget._banner, widget._image, widget._color1, widget._color2, widget._redirect),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15),
              child: Section("Diagnóstico")
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: AnimatedCircularChart(
                        key: widget._chart,
                        size: Size(200.0, 200.0),
                        initialChartData: widget._data,
                        chartType: CircularChartType.Radial,
                        edgeStyle: SegmentEdgeStyle.round,
                        percentageValues: true,
                        holeLabel: widget._percentage.toString() + '%',
                        labelStyle: TextStyle(  
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: widget._color
                        ),
                      )
                    ),
                    Center(
                      child: Text(
                        widget._title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: widget._color
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15, bottom: 15),
                            child: Container(
                              height: 180,
                              width: 20,
                              color: widget._color
                            ),
                          )
                        ),
                        Expanded(
                          flex: 14,
                          child: Padding (
                            padding: EdgeInsets.only(top: 25, left: 15, bottom: 15, right: 15),
                            child: Center(
                              child: Text(
                                widget._text,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "BradleyHandITC"
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            )
                          ),
                        )
                      ],
                    )
                    
                  ],
                ),
              ),
            )
          ]
        )
      )
    );
  }
}
