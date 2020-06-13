import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/newsModel.dart';
import 'cards/news.dart';
import 'components/menuBar.dart';
import 'data/newsapi.dart';
import 'components/section.dart';
import 'models/userModel.dart';

class News extends StatelessWidget {

  final User _user;
  News(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBar(appBar: AppBar()),
      body: FutureBuilder<List<NewsModel>>(
        future: NewsAPI().getNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                final news = snapshot.data[index];
                return NewsItem(news, _user);
              }
            );
          }
          else if (snapshot.hasError)
            return Center(
              child: Text(
                "Não há notícias",
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 18
                )
              )
            );

          return Center(child: CircularProgressIndicator());
        }
      )
    );
  }
}