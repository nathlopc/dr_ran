import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/covidModel.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';

class CovidCard extends StatefulWidget {

  final Covid _data;
  final Color color;
  final String title;
  final String label1;
  final String label2;
  final List<CircularStackEntry> _chart = new List();
  final GlobalKey<AnimatedCircularChartState> _key = new GlobalKey<AnimatedCircularChartState>();
  CovidCard(this._data, this.color, this.title, this.label1, this.label2);

  void main() {
    double value = double.parse(label2 == 'Recuperados' ? _data.total : _data.novos);
    double base = double.parse(label2 == 'Recuperados' ? (int.parse(_data.total) + int.parse(_data.novos)).toString() : _data.total);
    double percentage = value * 100 / base;

    _chart.add(
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(percentage, color)
        ],
        rankKey: 'Covid'
      )
    );
  }

  @override
  State<StatefulWidget> createState() {
    main();
    return CovidTemplate();
  }
}

class CovidTemplate extends State<CovidCard> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Card(
        child: Padding (
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: Color.fromRGBO(51, 51, 51, 1),
                      height: 1.5,
                      fontSize: 12,
                    ),
                  ),
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.label2 == 'Recuperados' ? (int.parse(widget._data.total) + int.parse(widget._data.novos)).toString() : widget._data.total,
                  style: TextStyle(
                    color: widget.color,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.right,
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    widget.label1,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 10
                    ),
                    textAlign: TextAlign.right,
                  ),
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedCircularChart(
                  key: widget._key,
                  size: Size(120.0, 120.0),
                  initialChartData: widget._chart,
                  chartType: CircularChartType.Radial,
                  edgeStyle: SegmentEdgeStyle.round,
                  percentageValues: true,
                  holeLabel: (widget.label2 == 'Recuperados' ? widget._data.total : widget._data.novos).toString(),
                  labelStyle: TextStyle(  
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: widget.color
                  ),
                )
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  widget.label2,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 10
                  ),
                  textAlign: TextAlign.right,
                ),
              )
            ]
          )
        )
      )
    );
  }
}