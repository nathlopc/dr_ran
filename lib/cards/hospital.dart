import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/hospitalModel.dart';
import 'package:string_mask/string_mask.dart';

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
  var telefoneMask = new StringMask("## (##) ####-####");

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
                fontFamily: 'BradleyHandITC',
                color: Color.fromRGBO(112, 173, 71, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: InkWell(
              onTap: () {
                var telefone = widget._hospital.telefone;
                setState(() {
                  if (telefone != null)
                    _call = phoneCall('tel:' + telefone);
                });
              },
              child: ListTile(
                title: Text(
                  widget._hospital.telefone == null ? '-' : telefoneMask.apply(widget._hospital.telefone.replaceFirst('+', '')),
                  style: TextStyle(
                    color: Color.fromRGBO(68, 114, 196, 1)
                  ),
                ),
                leading: Icon(Icons.phone, size: 25,),
              ),
            ),
          ),
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
                    color: Color.fromRGBO(68, 114, 196, 1)
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