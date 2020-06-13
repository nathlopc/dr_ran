import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'cards/hospital.dart';
import 'models/hospitalModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/menuBar.dart';
import 'components/section.dart';

class Hospitais extends StatelessWidget {

  List<HospitalModel> hospitals = new List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuBar(appBar: AppBar()),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("hospitais").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final querySnapshot = snapshot.data;
            final documents = querySnapshot.documents;
            
            for (var item in documents)
            {
              hospitals.add(new HospitalModel(
                nome: item.data["nome"],
                telefone: item.data["telefone"],
                cidade: item.data["cidade"],
                estado: item.data["estado"],
                endereco: item.data["endereco"]
              ));
            }
          }
          return Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: GroupedListView<dynamic, String>(
              elements: hospitals,
              groupBy: (element) => element.estado,
              groupSeparatorBuilder: (String value) => Section(value),
              itemBuilder: (context, element) {
                return Hospital(element);
              },
              order: GroupedListOrder.ASC,
            )
          );
        }
      )
    );
  }
}