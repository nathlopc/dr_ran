import 'package:flutter/material.dart';
import 'models/userModel.dart';
import 'components/menuBar.dart';
import 'news.dart';
import 'components/section.dart';
import 'components/banner.dart';
import 'components/enumerable.dart';

class Guide extends StatelessWidget {
  
  final User _user;
  Guide(this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: MenuBar(appBar: AppBar()),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LinkBanner("Notícias", "assets/images/news.png", Color.fromRGBO(210, 147, 36, 1), Color.fromRGBO(0, 166, 144, 1), News(_user)),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Section("Guia"),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20, top: 5),
              child: Enumerable("1", Color.fromRGBO(158, 0, 93, 1), "Manter as mãos limpas", "Lave as mãos com água e sabão ou higienizador à base de álcool para matar vírus que podem estar nas suas mãos. Veja abaixo como hiegienizar corretamente as mãos com água e sabão:", false),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen("assets/images/lavar_sabao.png", "imagem"))),
                child: Hero(
                  tag: 'imagem',
                  child: Image(image: AssetImage("assets/images/lavar_sabao.png"),),
                )
              )
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Enumerable("2", Color.fromRGBO(241, 90, 36, 1), "Mantenha distância", "Mantenha pelo menos 1 metro de distância entre você e qualquer pessoa que esteja tossindo ou espirrando. Quando alguém tosse ou espirra, pulveriza pequenas gotas líquidas do nariz ou da boca, que podem conter vírus. Se você estiver muito próximo, poderá inspirar as gotículas – inclusive do vírus da COVID-19 se a pessoa que tossir tiver a doença.", true),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Enumerable("3", Color.fromRGBO(158, 0, 93, 1), "Evite passar as mãos no rosto", "Evite tocar nos olhos, nariz e boca. As mãos tocam muitas superfícies e podem ser infectadas por vírus. Uma vez contaminadas, as mãos podem transferir o vírus para os olhos, nariz ou boca. A partir daí, o vírus pode entrar no corpo da pessoa e deixá-la doente.", false)
            ),
            Enumerable("4", Color.fromRGBO(241, 90, 36, 1), "Higiene respiratória", "Cubra a boca e o nariz com a parte interna do cotovelo ou lenço quando tossir ou espirrar (em seguida, descarte o lenço usado imediatamente). Gotículas espalham vírus. Ao seguir uma boa higiene respiratória, você protege as pessoas ao seu redor contra vírus responsáveis por resfriado, gripe e COVID-19.", true),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Enumerable("5", Color.fromRGBO(158, 0, 93, 1), "Fique em casa", "Fique em casa se não se sentir bem. Se você tiver febre, tosse e dificuldade em respirar, procure atendimento médico. Siga as instruções da sua autoridade sanitária nacional ou local, porque elas sempre terão as informações mais atualizadas sobre a situação em sua área.", false)
            ),
            Enumerable("6", Color.fromRGBO(241, 90, 36, 1), "Evite viajar...", "Pessoas doentes devem adiar ou evitar viajar para as áreas afetadas por coronavírus. Áreas afetadas são países, áreas, províncias ou cidades onde há transmissão contínua – não áreas com apenas casos importados.", true),
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Enumerable("7", Color.fromRGBO(158, 0, 93, 1), "...Mas caso viaje", "Os viajantes que retornam das áreas afetadas devem monitorar seus sintomas por 14 dias e seguir os protocolos nacionais dos países receptores; e se ocorrerem sintomas, devem entrar em contato com um médico e informar sobre o histórico de viagem e os sintomas.", false),
            )
          ],
        )
      )
    );
  }
}

class DetailScreen extends StatelessWidget {

  final String imagem;
  final String tag;
  DetailScreen(this.imagem, this.tag);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: tag,
            child: Image(image: AssetImage(imagem)),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}