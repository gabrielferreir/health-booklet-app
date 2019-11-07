import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/core/utils/DataUtils.dart';
import 'package:health_booklet/main/detail/detail_page.dart';
import 'package:health_booklet/models/item_list_person_booklet.dart';
import 'package:health_booklet/models/person_vaccine_model.dart';
import 'package:path/path.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'vaccines_booklet.dart';

class VaccinesBookletContent extends StatefulWidget {
  final ItemListPersonBooklet booklet;

  const VaccinesBookletContent({Key key, @required this.booklet})
      : super(key: key);

  @override
  _VaccinesBookletContentState createState() => _VaccinesBookletContentState();
}

class _VaccinesBookletContentState extends State<VaccinesBookletContent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VaccinesBookletBloc, VaccinesBookletState>(
        builder: (context, state) {
      return BlocListener<VaccinesBookletBloc, VaccinesBookletState>(
          listener: (context, state) {
            if (state.sended)
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Atualizado com sucesso!')));
          },
          child: Stack(children: <Widget>[
            Container(
                height: 120,
                color: Theme.of(context).primaryColor,
                child: Row(children: <Widget>[
                  Container(
                      width: 64,
                      child: AppBar(
                          elevation: 0, backgroundColor: Colors.transparent)),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.booklet.person,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        Text(widget.booklet.booklet,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white60)),
                      ])
                ])),
            Container(
                padding: const EdgeInsets.only(top: 136.0),
                child: state.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView(
                        children: state.vaccines
                            .asMap()
                            .map((index, item) => MapEntry(
                                index,
                                VaccineItemList(
                                    personVaccine: item, index: index)))
                            .values
                            .toList()))
          ]));
    });
  }
}

class VaccineItemList extends StatelessWidget {
  final PersonVaccine personVaccine;
  final int index;

  VaccineItemList({@required this.personVaccine, @required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          '${personVaccine.vaccine.name} ${personVaccine.vaccine.dose != null ? '- ' + personVaccine.vaccine.dose : ''}'),
      subtitle: Text(
          '${DateUtils.toBRTime(personVaccine.minDate)} - ${DateUtils.toBRTime(personVaccine.maxDate)}'),
      leading: Checkbox(
          value: personVaccine.isOkay,
          onChanged: (bool value) {
            BlocProvider.of<VaccinesBookletBloc>(context).dispatch(CheckVaccine(
                idVaccine: personVaccine.id, value: value, index: index));
          }),
      trailing: IconButton(
        icon: Icon(Icons.info),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailPage(personVaccine: personVaccine)));
        }
      )
    );
  }
}
