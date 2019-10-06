import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/booklet/booklet_content.dart';

import 'booklet.dart';

class BookletPage extends StatefulWidget {
  @override
  _BookletPageState createState() => _BookletPageState();
}

class _BookletPageState extends State<BookletPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => BookletBloc()..dispatch(Started()),
      child: BookletContent(),
    );
  }
}
