import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinkBanner extends StatelessWidget {

  final String _text;
  final String _asset;
  final Color _color1;
  final Color _color2;
  final Widget _redirect;

  LinkBanner(this._text, this._asset, this._color1, this._color2, this._redirect);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => _redirect)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [_color1, _color2]
          ),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  _text,
                  style: TextStyle(
                    fontFamily: "BradleyHandITC",
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30
                  ),
                ),
              )
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Image(image: AssetImage(_asset))
              )
            )
          ]
        ),
      )
    );
  }
}