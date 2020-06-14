import 'package:http/http.dart' as http;
import 'dart:convert';

class IBGEAPI {

  Future<List<String>> getEstados() async {

    var url = "https://servicodados.ibge.gov.br/api/v1/localidades/estados";
    var response = await http.get(url);
    var estados = new List<String>();

    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      for (var estado in body)
      {
        estados.add(estado["sigla"]);
      }
    }

    return estados;
  }

  Future<List<String>> getCidades(String uf) async {

    var url = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/" + uf + "/municipios";
    var response = await http.get(url);
    var cidades = new List<String>();

    if (response.statusCode == 200)
    {
      var body = json.decode(response.body);
      for (var item in body)
      {
        cidades.add(item["nome"]);
      }
    }

    return cidades;
  }

}