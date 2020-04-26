import 'package:flutter/material.dart';
import '../models/newsModel.dart';

class NewsDetail extends StatelessWidget {
  
  final NewsModel _news;

  NewsDetail(this._news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Últimas Notícias"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                _news.title, 
                style: TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                _news.subtitle,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Image(
                image: new NetworkImage(_news.image)
              )
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                _news.content,
                style: TextStyle(
                  fontSize: 14
                ),
                textAlign: TextAlign.justify,
              )
            )
          ],
        ),
      )
    );
  }
}