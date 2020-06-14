import '../models/hospitalModel.dart';
import '../models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAPI {

  final database = Firestore.instance;
  final auth = FirebaseAuth.instance;

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

  Future<String> insertUser(User user) async {
    try
    {
      var _result = await auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.senha
      );

      var id = _result.user.uid;

      database.collection("usuarios")
        .document(id)
        .setData({
          'id': id,
          'nome': user.nome,
          'data': user.data,
          'sexo': user.sexo,
          'estado': user.estado,
          'cidade': user.cidade,
          'email': user.email
        });

      return null;
    }
    catch(e)
    {
      return e.message.toString();
    }
  }

}