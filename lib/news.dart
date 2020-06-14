import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/newsModel.dart';
import 'cards/news.dart';
import 'components/menuBar.dart';
import 'data/newsapi.dart';
import 'home.dart';
import 'models/userModel.dart';
import 'components/section.dart';
import 'components/banner.dart';

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
            return Column(
              children: <Widget> [
                LinkBanner("Guia", "assets/images/guide.png", Color.fromRGBO(241, 90, 36, 1), Color.fromRGBO(175, 18, 82, 1), Home(_user)),
                Section("Últimas Notícias"),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      final news = snapshot.data[index];
                      return NewsItem(news, _user);
                    }
                  )
                )
              ]
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