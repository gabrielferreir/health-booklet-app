import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/home/home_content.dart';
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
        body: BlocProvider(
            builder: (context) => HomeBloc()..dispatch(Started()), child: HomeContent()));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
