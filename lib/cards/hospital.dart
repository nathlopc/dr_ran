import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/hospitalModel.dart';

class Hospital extends StatelessWidget {

  final HospitalModel _hospital;
  Hospital(this._hospital);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.local_hospital),
        title: Text(_hospital.nome),
        subtitle: Text(_hospital.endereco + "\n" + _hospital.telefone),
        isThreeLine: true,
      )
    );
  }
}