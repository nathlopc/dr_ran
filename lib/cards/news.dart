import 'package:dr_ran/details/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/newsModel.dart';

class NewsItem extends StatelessWidget {

  final NewsModel _news;
  NewsItem(this._news);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: new InkWell(
        onTap: () { 
          Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(_news)));
        },
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Chip(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.all(0),
                label: Text(
                  "Últimas notícias",
                  style: TextStyle(
                    color: Colors.white,
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _news.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87
                ),
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left:20, right: 20),
              child: Image(
                image: NetworkImage(_news.image),
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                _news.subtitle,
                style: TextStyle(
                  color: Colors.black54
                )
              )
            )
          ],
        ),
      )
    );
  }
}