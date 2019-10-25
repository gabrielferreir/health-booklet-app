import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/add_person/add_person.dart';
import 'package:health_booklet/main/add_person/add_person_content.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:health_booklet/repository/person_repository.dart';

class AddPersonPage extends StatefulWidget {
  final bool editing;
  final Person person;

  AddPersonPage({this.editing, this.person});

  @override
  _AddPersonPageState createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = AddPersonBloc(personRepository: PersonRepository());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          title: Text(
            'Cadastrar dependente',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          actions: <Widget>[
            widget?.editing == true
                ? IconButton(
                    icon: Icon(Icons.delete, color: Colors.red.shade700),
                    onPressed: () {
                      bloc.dispatch(Delete(id: widget.person.id));
                    })
                : Container(
                    width: 32,
                    height: 32,
                  )
          ],
        ),
        body: BlocProvider(
            builder: (context) => bloc,
            child: AddPersonContent(
                person: widget.person, editing: widget.editing)));
  }
}
