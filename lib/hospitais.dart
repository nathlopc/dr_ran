import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cards/hospital.dart';
import 'models/hospitalModel.dart';

class Hospitais extends StatefulWidget {

  final List<HospitalModel> _hospitais = new List();
  
  @override
  State<StatefulWidget> createState() {
    getList();
    return ListaHospitais();
  }

  void getList() {
    _hospitais.add(new HospitalModel("Hospital Geral de Clínicas de Rio Branco", "Av. Nações Unidas, 700 - Bosque, Rio Branco - AC, 69900-478", "(68) 3223-3080"));
    _hospitais.add(new HospitalModel("Hospital Escola Dr. Hélvio Auto", "R. Cônego Fernando Lyra, s/n - Trapiche da Barra, Maceió - AL, 57017-420", "(82) 3315-6826"));
    _hospitais.add(new HospitalModel("Instituto da Mulher Dona Lindu", "Av. Mário Ypiranga, 1581 - Adrianópolis, Manaus - AM, 69057-002", "(92) 3643-8100"));
    _hospitais.add(new HospitalModel("Hospital Infantil Dr. Fajardo", "Av. Joaquim Nabuco, 1886 - Centro, Manaus - AM, 69020-031", "(92) 3131-3606"));
    _hospitais.add(new HospitalModel("Hospital de Referencia Ana Braga", "Av. Cosme Ferreira, s/n - São José I, Manaus - AM, 69083-000", "(92) 3647-4200"));
    _hospitais.add(new HospitalModel("Hospital e Pronto Socorro da Criança Zona Leste", "Alameda Cosme Ferreira 3775 São José 1, Manaus - AM, 69082-230", "(92) 3647-1701"));
    _hospitais.add(new HospitalModel("Hospital Delphina Rinaldi Abdel Aziz", "Av. Torquato Tapajós, 9250 - Colônia Terra Nova, Manaus - AM, 69093-415", "(92) 3090-0500"));
    _hospitais.add(new HospitalModel("Instituto da Criança do Amazonas", "Av. Codajás, s/n - Cachoeirinha, Manaus - AM, 69065-130", "(92) 3612-4663"));
    _hospitais.add(new HospitalModel("Centro de Referência em Doenças Transmissíveis (CDT) do Hospital de Especialidades Dr. Alberto Lima", "R. Jovino Dinoá, 2004 - Macapá - AP, 68906-420", "-"));
    _hospitais.add(new HospitalModel("Instituto Couto Maia (ICON)", "R. Cel. Azevedo, S/N - Águas Claras, Salvador - BA, 41301-110", "(71) 3103-7150"));
    _hospitais.add(new HospitalModel("Hospital São José", "R. Nestor Barbosa, 315 - Parquelândia, Fortaleza - CE, 60455-610", "(85) 3101-2352"));
    _hospitais.add(new HospitalModel("Hospital Regional da Asa Norte", "SMHN Q 2 - Asa Norte, Brasília - DF, 70710-100", "(61) 2017-1900"));
    _hospitais.add(new HospitalModel("Hospital Estadual Jayme dos Santos Neves - HEJSN", "Av. Paulo Pereira Gomes, S/N - Morada de Laranjeiras, Serra - ES, 29166-828", "(27) 3331-7500"));
    _hospitais.add(new HospitalModel("Hospital Infantil Nossa Senhora da Glória - HINSG", "Alameda Mari Ubirajara, 205 - Santa Lucia, Vitória - ES, 29056-030", "(27) 3198-7400"));
    _hospitais.add(new HospitalModel("Hospital Estadual de Doenças Tropicais - HDT", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Estadual Materno Infantil", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital de Referência Estadual de Alta Complexidade Dr. Carlos Macieira", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Presidente Vargas", "-", "-"));
    _hospitais.add(new HospitalModel("Eduardo de Menezes", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário Maria Aparecida Pedrosian", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário Julio Muller", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional Público da Transamazônica (Altamira)", "-", "-"));
    _hospitais.add(new HospitalModel("Fundação Santa Casa de Misericórdia do Pará (Belém)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional Abelardo Santos (Belém)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário Joçao de Barros Barreto (HUJBB)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional público do Marajo (Breves)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital regional de Conceição do Araguaia (Conceição do Araguaia)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional do Sudeste do Pará (Marabá)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional Público do Leste (Paragominas)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional Público do Araguaia (Redenção)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional do Baixo Amazonas (Santarém)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional de Tucuruí (Tucurui)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário Lauro Wanderley", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Clementino Fraga", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Correia Picanço", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário Oswaldo Cruz", "-", "-"));
    _hospitais.add(new HospitalModel("Instituto de Doenças Tropicais Natan Portela - IDTNP", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário do Oeste do Paraná - Cascavel", "-", "-"));
    _hospitais.add(new HospitalModel("Complexo Hospitalar do Trabalhador - Curitiba", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Municipal de Foz do Iguaçu Padre Germano Lauck - Foz do Iguaçu", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário da Região Norte do Paraná - Londrina", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário Regional de Maringá - Maringá", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Regional do Litoral - Paranaguá", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário Regional dos Campos Gerais - Ponta Grossa", "-", "-"));
    _hospitais.add(new HospitalModel("INI - Instituto Nacional de Infectologia Evandro Chagas - Fiocruz", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Rafael Fernandes (Mossoró)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Giselda Trigueiro (Natal)", "-", "-"));
    _hospitais.add(new HospitalModel("Centro de Medicina Tropical (CEMETRON)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Infantil Cosme Damião", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital da Criança Santo Antônio (HCSA)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Geral de Roraima (HGR)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Universitário de Canoas", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Nossa Senhora da Conceição", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Nereu Ramos (adulto)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Infantil Joana Gusmão (crianças até 15 anos)", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Governador João Alves Filho ( Hospital de Urgências de Sergipe)", "-", "-"));
    _hospitais.add(new HospitalModel("Instituto de Infectologia Emílio Ribas", "-", "-"));
    _hospitais.add(new HospitalModel("Hospital Geral de Palmas (HGP)", "-", "-"));
  }
}

class ListaHospitais extends State<Hospitais> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Hospitais")
      ),
      body: ListView.builder(
        itemCount: widget._hospitais.length,
        itemBuilder: (context, index) {
          final hospital = widget._hospitais[index];
          return Hospital(hospital);
        }
      ),
    );
  }
}