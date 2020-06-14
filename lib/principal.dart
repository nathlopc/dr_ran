import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/footer.dart';
import 'cadastro.dart';
import 'login.dart';

class Principal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Page();
  }
}

class Page extends State<Principal> {

  final GlobalKey _part1 = GlobalKey();
  final ValueNotifier<double> height = ValueNotifier<double>(-1);

  void initState()
  {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => height.value = _part1.currentContext.size.height);
  }

  getSize() {
    final RenderBox obj = _part1.currentContext.findRenderObject();
    return obj.size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Color.fromRGBO(51, 51, 51, 1)
        ),
      ),
      bottomSheet: Footer(),
      body: Stack (
        children: <Widget>[
          Positioned (
            bottom: 0,
            child: Container (
              color: Color.fromRGBO(51, 51, 51, 1),
              height: 418,
              width: MediaQuery.of(context).size.width,
              child: Padding (
                padding: EdgeInsets.only(top: 120, bottom: 30),
                child: Column (
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: SizedBox (
                          width: MediaQuery.of(context).size.width - 80,
                          child: RaisedButton(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Cadastre-se",
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                            color: Colors.transparent,
                            textColor: Color.fromRGBO(255, 192, 0, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Color.fromRGBO(255, 192, 0, 1)
                              )
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Cadastro()))
                          ),
                        )
                      )
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 15, bottom: 15),
                        child: SizedBox (
                          width: MediaQuery.of(context).size.width - 80,
                          child: RaisedButton(
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                fontSize: 16
                              ),
                            ),
                            color: Colors.transparent,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                color: Colors.white
                              )
                            ),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login()))
                          ),
                        )
                      )
                    )
                  ]
                ),
              )
            )
          ),
          Flexible (
            key: _part1,
            child: Column (
              children: <Widget>[
                Text(
                  "dr. ran",
                  style: TextStyle(
                    fontFamily: 'BradleyHandITC',
                    fontSize: 80
                  ),
                ),
                Image (
                  image: AssetImage('assets/images/frog4.png')
                )
              ],
            )
          ),
        ],
      )
    );
  }
}