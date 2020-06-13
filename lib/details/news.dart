import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import '../components/menuBar.dart';
import '../home.dart';
import '../models/userModel.dart';

class NewsDetail extends StatelessWidget {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  final String _url;
  final User _user;

  NewsDetail(this._url, this._user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "dr. ran",
            style: TextStyle(
              fontFamily: 'BradleyHandITC',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 24
            ),
          )
        ),
        backgroundColor: Color.fromRGBO(51, 51, 51, 1),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Home(_user)))
          ),
        ],
      ),
      body: WebView(
        initialUrl: _url,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(webViewController);
        },
      )
    );
  }
}