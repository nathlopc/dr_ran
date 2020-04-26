import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../models/hospitalModel.dart';

class Hospital extends StatelessWidget {

  final HospitalModel _hospital;
  Hospital(this._hospital);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              _hospital.nome,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),
            ),
          ),
          /*Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                debugPrint(_hospital.telefone);
              },
              child: ListTile(
                title: Text(
                  _hospital.telefone,
                  style: TextStyle(
                    color: Colors.lightBlue
                  ),
                ),
                leading: Icon(Icons.phone, size: 25,),
              ),
            ),
          ),*/
          Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: ListTile(
              title: Text(_hospital.telefone, style: TextStyle(color: Colors.black54)),
              leading: Icon(Icons.phone),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () {
                MapsLauncher.launchQuery(_hospital.endereco);
              },
              child: ListTile(
                title: Text(
                  _hospital.endereco,
                  style: TextStyle(
                    color: Colors.lightBlue
                  )
                ),
                leading: Icon(Icons.location_on, size: 30,),
              )
            )
          )
        ],
      )
    );
  }
}