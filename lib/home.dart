import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'main.dart';
import 'news.dart';
import 'consulta.dart';
import 'models/userModel.dart';
import 'hospitais.dart';
import 'cards/news.dart';
import 'models/newsModel.dart';
import 'data/firebase.dart';
import 'components/section.dart';
import 'cards/covid.dart';
import 'models/covidModel.dart';
import 'data/covidAPI.dart';
import 'data/newsapi.dart';
import 'components/menuBar.dart';
import 'guide.dart';

class Home extends StatelessWidget {

  final User _user;
  Home(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Column (
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Center(
              child: Container (
                padding: EdgeInsets.all(20),
                color: Colors.amberAccent[100],
                width: 500,
                height: 100,
                child: ListTile(
                  leading: Icon(Icons.warning, size: 50,),
                  title: Text("Atenção!"),
                  subtitle: Text("Respeite as ordens de isolamento social do seu Estado."),
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
              child: Section("Coronavírus no Brasil")
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(
                children: <Widget>[
                  FutureBuilder<List<Covid>>(
                    future: CovidAPI().getCovidData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CovidCard(snapshot.data[0], Color.fromRGBO(251, 174, 23, 1), "Casos Confirmados", "Total", "Novos"),
                            CovidCard(snapshot.data[1], Color.fromRGBO(127, 71, 221, 1), "Óbitos\n", "Total", "Novos"),
                            CovidCard(snapshot.data[2], Color.fromRGBO(136, 168, 13, 1), "Casos Tratados\n", "Total", "Recuperados")
                          ],
                        );
                      }
                      
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Card(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.all(30),
                                child: snapshot.hasError 
                                  ? Text(
                                    "Não há dados sobre Covid-19",
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontSize: 18
                                    )
                                  ) 
                                  : Center(
                                    child: CircularProgressIndicator()
                                  )
                              )
                            )
                          )
                        ]
                      );
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget> [
                        Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 15, right: 7.5),
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Consulta(_user))),
                            child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color.fromRGBO(255, 192, 0, 1), Color.fromRGBO(128, 72, 219, 1)]
                              )
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15, bottom: 15),
                                child: Text(
                                  "Teste Covid-19",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              )
                            ),
                          ),
                          )
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Consulta(_user))),
                            child: Positioned(
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Image(
                                    image: AssetImage("assets/images/test.png")
                                  ),
                                )
                              ),
                            ),
                          )
                        )
                      ]
                    )
                  ),
                  Expanded(
                    child: Stack(
                      children: <Widget> [
                        Padding(
                          padding: EdgeInsets.only(top: 50, bottom: 15, right: 7.5),
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Guide(_user))),
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Color.fromRGBO(241, 90, 36, 1), Color.fromRGBO(159, 1, 93, 1)]
                                )
                              ),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15, bottom: 15),
                                  child: Text(
                                    "Guia",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                )
                              ),
                            ),
                          )
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Positioned(
                            child: InkWell(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Guide(_user))),
                              child: Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Image(
                                    image: AssetImage("assets/images/guide_color.png")
                                  ),
                                )
                              ),
                            ),
                          )
                        )
                      ]
                    )
                  )
                ]
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Section("Últimas Notícias")
            ),
            SizedBox(
              height: 700,
              child: FutureBuilder<List<NewsModel>>(
                future: NewsAPI().getNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: <Widget> [
                        Expanded(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return (index == 5)
                              ? Align(
                                alignment: Alignment.center, 
                                child: Padding(
                                  padding: EdgeInsets.only(left: 15, right: 30),
                                  child: ClipOval(
                                    child: Material(
                                      color: Color.fromRGBO(0, 169, 157, 1),
                                      child: InkWell(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => News(_user))),
                                        child: SizedBox(
                                          width: 50, 
                                          height: 50, 
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white
                                          )
                                        ),
                                      ),
                                    )
                                  ),
                                ),
                              )
                              : NewsItem(snapshot.data[index], _user);
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
            ),
          ]
        )
      ),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: Text(_user.nome), 
              accountEmail: Text(_user.email),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              decoration: BoxDecoration(
                color: Color.fromRGBO(51, 51, 51, 1)
              )
            ),
            new ListTile(
              title: Text("Notícias"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => News(_user)));
              },
            ),
            new ListTile(
              title: Text("Teste de Covid-19"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Consulta(_user)));
              },
            ),
            new ListTile(
              title: Text("Guia"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Guide(_user)));
              },
            ),
            new ListTile(
              title: Text("Hospitais"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Hospitais()));
              },
            ),
            new Divider(),
            /*new ListTile(
              title: Text("Profile"),
              onTap: () async { 
                await FirebaseAPI().logout();

                Navigator.push(context, new MaterialPageRoute(builder: (context) => Main()));
              }
            ),*/
            new ListTile(
              title: Text("Sair"),
              onTap: () async { 
                await FirebaseAPI().logout();

                Navigator.push(context, new MaterialPageRoute(builder: (context) => Main()));
              }
            ),
            new ListTile(
              title: Text(
                "Excluir conta",
                style: TextStyle(
                  color: Colors.red
                ),
              ),
              onTap: () async { 
                await FirebaseAPI().delete().then((sucesso) {
                  Alert(
                    context: context, 
                    title: "Sucesso",
                    desc: "Sua conta foi excluída com sucesso!",
                    type: AlertType.success,
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Main()));
                        },
                        width: 120,
                      )
                    ]
                  ).show();
                }).catchError((erro) {
                  Alert(
                    context: context, 
                    title: "Erro", 
                    desc: erro.toString(),
                    type: AlertType.error,
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => Navigator.pop(context),
                        width: 120,
                      )
                    ]
                  ).show();
                });
              }
            )
          ]
        )
      )
    );
  }
}