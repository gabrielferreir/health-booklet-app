import 'package:flutter/material.dart';
import 'package:health_booklet/services/user.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Health Boolet',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text('Olá Gabriel',
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor))),
                ListTile(
                    title: Text('Suas cadernetas',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54))),
                Progress(),
                Progress(),
                ListTile(
                    title: Text('Proximas vacinas',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                            color: Colors.black54))),
                CardVaccine(),
                CardVaccine(type: 0,),
//                MyCard(),
              ],
            )));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: IntrinsicHeight(
            child: Row(children: <Widget>[
          Container(
            width: 110,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.network(
                  'https://f.i.uol.com.br/fotografia/2018/09/13/15368809905b9af15e26c78_1536880990_3x2_md.jpg'),
            ),
          ),
          Expanded(
              child: Container(
//                color: Colors.indigo,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Campanha de vacinação B',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500)),
                            Text(
                              'Campanha de vacinação B Campanha de vacinação B Campanha de vacinação B Campanha de vacinação B .',
                              maxLines: 4,
                            )
                          ]))))
        ])));
  }
}

class Progress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(bottom: 12),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 2,
        child: Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Row(children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Cartilha 2017',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500)),
                    Container(height: 2),
                    Text('Gabriel Ferreira',
                        style: TextStyle(fontSize: 14, color: Colors.black54))
                  ],
                ),
              ),
              Column(children: <Widget>[
                Text('8/28',
                    style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500)),
                Text('Vacinas',
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor.withOpacity(0.5)))
              ])
            ])));
  }
}

class CardVaccine extends StatelessWidget {
  final int type;

  CardVaccine({@required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 2,
      child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Febre Amarela',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500)),
                  Container(height: 2),
                  Text('Gabriel Ferreira',
                      style: TextStyle(fontSize: 14, color: Colors.black54))
                ],
              ),
            ),
            type == 0 ?
            Column(children: <Widget>[
              Text('1',
                  style: TextStyle(
                      fontSize: 24,
                      color: Theme
                          .of(context)
                          .primaryColor,
                      fontWeight: FontWeight.w500)),
              Text('MÊS',
                  style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).primaryColor.withOpacity(0.5)))
            ]) : Text('Já pode tomar',
                style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).primaryColor.withOpacity(0.5)))
          ])),
    );
  }
}
