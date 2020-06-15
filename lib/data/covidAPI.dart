import 'package:http/http.dart' as http;
import '../models/covidModel.dart';
import 'dart:convert';

class CovidAPI {

  Future<List<Covid>> getCovidData() async {
    final response = await http.get('https://xx9p7hp1p7.execute-api.us-east-1.amazonaws.com/prod/PortalGeralApi');
    List<Covid> data = new List();

    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      var atualizado = body["dt_updated"];
      data.add(new Covid(atualizado: atualizado, total: body["confirmados"]["total"].toString(), novos: body["confirmados"]["novos"].toString()));
      data.add(new Covid(atualizado: atualizado, total: body["obitos"]["total"].toString(), novos: body["obitos"]["novos"].toString()));
      data.add(new Covid(atualizado: atualizado, total: body["confirmados"]["acompanhamento"].toString(), novos: body["confirmados"]["recuperados"].toString()));
    }
    
    return data;
  }

}