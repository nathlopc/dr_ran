import 'package:http/http.dart' as http;
import '../models/newsModel.dart';
import 'dart:convert';

class NewsAPI {

  Future<List<NewsModel>> getNews() async {
    var date = new DateTime.now().toString().split(" ")[0];
    var url = "http://newsapi.org/v2/everything?q=coronavírus&from=" + date + "&sortBy=publishedAt&apiKey=1b0f9867c1ff40368fd5a69b83b1cfb2&domains=globo.com,theintercept.com,cnnbrasil.com.br,uol.com.br,folha.uol.com.br,estadao.com.br,noticias.r7.com,tvgazeta.com.br,bandnewsfm.band.uol.com.br&pageSize=20&page=1";
    var response = await http.get(url);
    var news = new List<NewsModel>();
    
    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      if (body["status"] == "ok")
      {
        for (var item in body["articles"])
        {
          news.add(NewsModel(
            title: item["title"], 
            subtitle: item["description"].toString().replaceFirst("Leia mais", ""), 
            image: item["urlToImage"], 
            link: item["url"],
            place: item["source"]["name"]
          ));
        }
      }
    }

    return news;
  }

}