import 'package:health_booklet/core/drawer/drawer.dart';
import 'package:health_booklet/repository/epidemic_repository.dart';
import 'package:health_booklet/services/user.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc;

  @override
  void initState() {
    this.homeBloc = HomeBloc(epidemicRepository: EpidemicRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(userService: UserService()),
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
        body: HomeContent(homeBloc: homeBloc));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
