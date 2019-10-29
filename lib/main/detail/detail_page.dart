import 'package:flutter/material.dart';
import 'package:health_booklet/models/person_vaccine_model.dart';

class DetailPage extends StatelessWidget {
  final PersonVaccine personVaccine;

  DetailPage({@required this.personVaccine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Text(
              personVaccine.vaccine.name,
              style: TextStyle(color: Theme.of(context).primaryColor),
            )),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: <Widget>[
              Text(personVaccine.vaccine.description,
                  style: TextStyle(color: Colors.black87, fontSize: 16))
            ])));
  }
}
