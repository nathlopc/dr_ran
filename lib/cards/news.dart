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
      child: ListTile(
        leading: Icon(Icons.local_library),
        title: Text(_news.title),
        subtitle: Text(_news.subtitle),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsDetail(_news)))
      )
    );
  }
}