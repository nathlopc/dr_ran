import '../models/hospitalModel.dart';
import '../models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseAPI {

  final database = Firestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

  Future<List<HospitalModel>> getHospitais() async {
    var snapshots = database.collection("hospitais").snapshots();
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
      return Future.error("Erro ao cadastrar usuário. Verifique os campos.");
    }
  }

  Future<User> login(String email, String senha) async {
    User _loggedUser;

    try
    {
      var result = await auth.signInWithEmailAndPassword(email: email, password: senha);

      if (result.user != null)
      {
        var _result = await database.collection("usuarios").document(result.user.uid).get();
        
        if (_result.data != null)
        {
          _loggedUser = new User(
            cidade: _result.data["cidade"],
            email: email,
            data: _result.data["data"],
            estado: _result.data["estado"],
            nome: _result.data["nome"],
            sexo: _result.data["sexo"]
          );
        }
      }
    }
    catch(e)
    {
      var mensagem = "";
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
          mensagem = "E-mail inválido!";
          break;
        case "ERROR_WRONG_PASSWORD":
          mensagem = "Senha incorreta!";
          break;
        case "ERROR_USER_NOT_FOUND":
          mensagem = "Usuário não cadastrado!";
          break;
        case "ERROR_USER_DISABLED":
          mensagem = "Usuário não cadastrado!";
          break;
        default:
          mensagem = "Ocorreu um erro. Tente novamente mais tarde.";
          break;
      }
      return Future.error(mensagem);
    }

    return _loggedUser;
  }

  Future<void> delete() async {
    var _user = await auth.currentUser();

    await database.collection("usuarios").document(_user.uid).delete()
    .then((value) {
      _user.delete();
    })
    .catchError((erro)
    {
      return Future.error("Não foi possível excluir sua conta. Tente novamente mais tarde.");
    });
  }

  Future<bool> logout() async {
    await auth.signOut();
  }
}