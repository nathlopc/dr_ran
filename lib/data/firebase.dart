import '../models/hospitalModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAPI {

  final database = Firestore.instance;

  Future<List<HospitalModel>> getHospitais() async {
    var snapshots = await database.collection("hospitais").snapshots();
    var hospitais = new List<HospitalModel>();
    
    snapshots.map<QuerySnapshot>((snapshot) {
      for(var item in snapshot.documents) {
        hospitais.add(
          HospitalModel(
            nome: item.data["nome"],
            telefone: item.data["telefone"],
            estado: item.data["estado"],
            cidade: item.data["cidade"],
            endereco: item.data["endereco"]
          )
        );
      }
    });

    return hospitais;
  }

}