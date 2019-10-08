import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/add_booklet/add_booklet_content.dart';

import 'add_booklet.dart';

class AddBookletPage extends StatefulWidget {
  @override
  _AddBookletPageState createState() => _AddBookletPageState();
}

class _AddBookletPageState extends State<AddBookletPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) =>
          AddBookletBloc()..dispatch(SearchPerson()),
      child: AddBookletContent(),
    );
  }
}
