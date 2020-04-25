import 'package:flutter/material.dart';
import '../models/newsModel.dart';

class NewsDetail extends StatelessWidget {
  
  final NewsModel _news;

  NewsDetail(this._news);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notícia"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              _news.title, 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              _news.subtitle,
              style: TextStyle(fontSize: 11),
            ),
            Image(image: new NetworkImage(_news.image)),
            Text(
              _news.content,
              style: TextStyle(fontSize: 12)
            )
          ],
        ),
      )
    );
  }
}