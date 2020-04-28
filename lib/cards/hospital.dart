import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/hospitalModel.dart';

class Hospital extends StatefulWidget {

  final HospitalModel _hospital;
  Hospital(this._hospital);

  @override
  State<StatefulWidget> createState() {
    return HospitalItem();
  }
}

class HospitalItem extends State<Hospital> {
  
  Future<void> _call;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              widget._hospital.nome,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                var telefone = widget._hospital.telefone;
                setState(() {
                  _call = phoneCall('tel:' + telefone);
                });
              },
              child: ListTile(
                title: Text(
                  widget._hospital.telefone,
                  style: TextStyle(
                    color: Colors.lightBlue
                  ),
                ),
                leading: Icon(Icons.phone, size: 25,),
              ),
            ),
          ),
          /*Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: ListTile(
              title: Text(widget._hospital.telefone, style: TextStyle(color: Colors.black54)),
              leading: Icon(Icons.phone),
            ),
          ),*/
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: InkWell(
              onTap: () {
                MapsLauncher.launchQuery(widget._hospital.endereco);
              },
              child: ListTile(
                title: Text(
                  widget._hospital.endereco,
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

Future<void> phoneCall(String phone) async {
  if (await canLaunch(phone)) {
    await launch(phone);
  }
  else {
    debugPrint('Could not make phone call to $phone');
  }
}