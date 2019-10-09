import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/vaccines_booklet/vaccines_booklet_content.dart';
import 'package:health_booklet/models/item_list_person_booklet.dart';

import 'vaccines_booklet.dart';

class VaccinesBookletPage extends StatefulWidget {
  final ItemListPersonBooklet booklet;

  const VaccinesBookletPage({Key key, @required this.booklet})
      : super(key: key);

  @override
  _VaccinesBookletPageState createState() => _VaccinesBookletPageState();
}

class _VaccinesBookletPageState extends State<VaccinesBookletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          builder: (BuildContext context) =>
              VaccinesBookletBloc()..dispatch(Started(id: widget.booklet.id)),
          child: VaccinesBookletContent(booklet: widget.booklet),
        ),
      ),
    );
  }
}
