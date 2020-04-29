import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'news.dart';
import 'consulta.dart';
import 'models/userModel.dart';
import 'hospitais.dart';
import 'cards/news.dart';
import 'models/newsModel.dart';

class Home extends StatelessWidget {

  final User _user;
  Home(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SingleChildScrollView(
        child: Column (
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
              padding: EdgeInsets.all(0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Consulta(_user)));
                        },
                        child: Container (
                          margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                          padding: EdgeInsets.all(20),
                          width: 180,
                          height: 240,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(242,156,33,1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(242,156,33,0.5),
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: Offset(0,0),
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: NetworkImage('http://marcelotoledo.com/wp-content/uploads/2016/04/teste-ab-checklist-1680x1680.jpg'),
                              ),
                              Text(
                                "Teste de\nCovid-19",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              )
                            ]
                          )
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Hospitais()));
                        },
                        child: Container (
                          margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
                          padding: EdgeInsets.all(20),
                          width: 180,
                          height: 240,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(85,153,255,1),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(85,153,255,0.5),
                              blurRadius: 4.0,
                              spreadRadius: 2.0,
                              offset: Offset(0,0),
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              Image(
                                image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR3QU9I70aLyrjoElpJS0OsG3l8FiMO4AwjpAlQRI0HCTWK95ui&usqp=CAU'),
                              ),
                              Text(
                                "Encontre\num hospital",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                                textAlign: TextAlign.center,
                              )
                            ],
                          )
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
            NewsItem(new NewsModel("Coronavírus: Teich diz que governo vai distribuir 272 respiradores a estados", "Ministro da Saúde também falou que enviará mais um milhão de testes rápidos", "https://ogimg.infoglobo.com.br/in/24384696-ab4-39b/FT1086A/652/xrespiradores.jpg.pagespeed.ic.gK2GBcj89d.jpg", "O ministro da Saúde, Nelson Teich, afirmou em ume rede social neste sábado que o governo recebeu 272 respiradores fabricados no Brasil e começou a enviar os equipamentos aos estados. Segundo ele, serão 14.100 respiradores no total, utilizados em casos graves do novo coronavírus. O ministro afirmou que o Amazonas já recebeu 35 respiradores e deve receber mais 20. O estado é um dos mais afetados pela pandemia, com 3.635 casos confirmados da doença e 287 mortes, segundo o balanço da Secretaria de Saúde do Amazonas deste sábado. O Paraná também deve receber mais cinco respiradores, além dos 15 já entregues.Os outros estados contemplados foram Amapá (25), Ceará (45), Espírito Santo (10), Pará (20), Piauí (20), Rio de Janeiro (40) e Santa Catarina (17). ""Com isso, estamos equipando melhor os hospitais para receber os pacientes com Covid-19"", afirmou no Twitter. De acordo com o último balanço do Ministério da Saúde, o Brasil tem 52.995 infectados com a Covid-19 e 3.670 mortes provocadas pela doença. Teich disse que o ministério vai enviar nos próximos dias quase 1 milhão de testes rápidos para os estados, chegando a um total de 3 milhões. De acordo com ele, essa medida é ""fundamental para respostas mais assertivas ao Covid-19"". Em seu discurso de posse, o oncologista defendeu a necessidade de ampliar a testagem para a doença no Brasil, mas já ressaltou mais de uma vez que não haverá exames para toda a população. Segundo Teich, o até o fim da semana, o governo federal terá entregue também 79 milhões de equipamentos de proteção individual (EPIs), utilizados para proteger profissionais de saúde da doença.")),
            Padding(
              padding: EdgeInsets.all(20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => News()));
                },
                child: Text(
                  "Veja mais notícias", 
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            )
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
                backgroundImage: new NetworkImage('https://img.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg?size=338&ext=jpg'),
              ),
            ),
            new ListTile(
              title: Text("Notícias"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => News()));
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
              title: Text("Hospitais"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => Hospitais()));
              },
            ),
            new Divider(),
            new ListTile(
              title: Text("Sair"),
              onTap: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => Main()))
            )
          ]
        )
      )
    );
  }
}