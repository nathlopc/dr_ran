import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {

  final String label;

  Section(this.label);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Divider(color: Colors.black87,)
        ),       
        Padding(
          padding: EdgeInsets.all(15),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'BradleyHandITC',
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          )
        ),
        Expanded(
          child: Divider(color: Colors.black87,)
        ),
      ]
    );
  }
}