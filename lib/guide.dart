import 'package:flutter/material.dart';
import 'data/newsapi.dart';
import 'models/newsModel.dart';
import 'models/userModel.dart';
import 'cards/news.dart';
import 'components/menuBar.dart';

class Guide extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: MenuBar(appBar: AppBar()),
      body: Text("Guia")
    );
  }
}