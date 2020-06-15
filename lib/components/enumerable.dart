import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Enumerable extends StatelessWidget {

  final String number;
  final Color color;
  final String title;
  final String text;
  final bool inverse;
  Enumerable(this.number, this.color, this.title, this.text, this.inverse);

  @override
  Widget build(BuildContext context) {
    return inverse
    ? Row(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 7.5),
                child: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "BradleyHandITC"
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7.5, left: 15),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5
                  ),
                  textAlign: TextAlign.justify,
                )
              )
            ]
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle
              ),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                )
              ),
            ),
          )
        )
      ],
    )
    : Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle
              ),
              child: Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                )
              ),
            ),
          )
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 7.5),
                child: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "BradleyHandITC"
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 7.5, right: 15),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5
                  ),
                  textAlign: TextAlign.justify,
                )
              )
            ]
          ),
        )
      ],
    );
  }
}