import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/newsModel.dart';
import 'cards/news.dart';
import 'components/menuBar.dart';
import 'data/newsapi.dart';
import 'home.dart';
import 'models/userModel.dart';
import 'components/section.dart';

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
                GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(_user))),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color.fromRGBO(241, 90, 36, 1), Color.fromRGBO(175, 18, 82, 1)]
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              "Guia",
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
                            child: Image(image: AssetImage('assets/images/guide.png'))
                          )
                        )
                      ]
                    ),
                  )
                ),
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