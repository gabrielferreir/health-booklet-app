import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/home/home.dart';
import 'package:health_booklet/models/next_vaccine_item.dart';
import 'package:health_booklet/models/percentage_item.dart';
import 'package:timeago/timeago.dart' as timeago;


class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('pt_BR_short', timeago.PtBrShortMessages());
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: state.loading
                ? LinearProgressIndicator()
                : Column(
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
                      ...state.listPercentage
                          .map<Widget>((item) => Progress(item: item))
                          .toList(),
                      ListTile(
                          title: Text('Proximas vacinas',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54))),
                      ...state.listVaccine
                          .map<Widget>((item) => CardVaccine(item: item))
                          .toList(),
//                MyCard(),
                    ],
                  ));
      },
    );
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
  final PercentagemItem item;

  Progress({@required this.item});

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
                    Text(item.booklet,
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500)),
                    Container(height: 2),
                    Text(item.person,
                        style: TextStyle(fontSize: 14, color: Colors.black54))
                  ],
                ),
              ),
              Column(children: <Widget>[
                Text('${item.taken}/${item.total}',
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
  final NextVaccineItem item;

  CardVaccine({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 2,
      child: Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          child: Row(children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(item.vaccine,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500)),
                  Container(height: 2),
                  Text(item.person,
                      style: TextStyle(fontSize: 14, color: Colors.black54))
                ],
              ),
            ),
            item.maxDate.isAfter(DateTime.now())
                ? Column(children: <Widget>[
                    Text(timeago.format(item.minDate, allowFromNow: true, locale: 'pt_BR_short').replaceAll(RegExp('[^0-9.]'), ''),
                        style: TextStyle(
                            fontSize: 24,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w500)),
                    Text(timeago.format(item.minDate, allowFromNow: true, locale: 'pt_BR_short').replaceAll(RegExp('[0-9.]'), '').toUpperCase(),
                        style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.5)))
                  ])
                : Text('Já pode tomar',
                    style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).primaryColor.withOpacity(0.5)))
          ])),
    );
  }
}
