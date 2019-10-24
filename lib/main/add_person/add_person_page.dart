import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/add_person/add_person.dart';
import 'package:health_booklet/main/add_person/add_person_content.dart';
import 'package:health_booklet/repository/person_repository.dart';

class AddPersonPage extends StatefulWidget {
  @override
  _AddPersonPageState createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            'Cadastrar dependente',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        body: BlocProvider(
            builder: (context) =>
                AddPersonBloc(personRepository: PersonRepository()),
            child: AddPersonContent()));
  }
}
