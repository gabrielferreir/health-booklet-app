import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/add_person/add_person.dart';
import 'package:health_booklet/main/register_user/components/DateField.dart';
import 'package:health_booklet/main/register_user/components/Genre.dart';
import 'package:health_booklet/models/person_model.dart';

class AddPersonContent extends StatefulWidget {
  final bool editing;
  final Person person;

  AddPersonContent({this.editing, this.person});

  @override
  _AddPersonContentState createState() => _AddPersonContentState();
}

class _AddPersonContentState extends State<AddPersonContent> {
  TextEditingController name;
  DateTime birthday;
  bool isMale;

  @override
  void initState() {
    setValue();
    super.initState();
  }

  setValue() {
    if (widget?.editing == true) {
      this.name = TextEditingController(text: widget.person.name);
      this.birthday = widget.person.birthday;
      this.isMale = widget.person.isMale;
    } else {
      this.name = TextEditingController();
      this.birthday = DateTime.now();
      this.isMale = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPersonBloc, AddPersonState>(listener:
        (context, state) {
      if (state.deleted) Navigator.pop(context, true);
      if (state.registred) Navigator.pop(context, true);
    }, child:
        BlocBuilder<AddPersonBloc, AddPersonState>(builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(children: <Widget>[
              input(label: 'Nome', controller: name),
              DateField(callback: _setBirthday, selectedDate: birthday),
              Genre(callback: _setGenre, isMale: isMale)
            ])),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: _onSubmit,
            label: !state.saving
                ? Text(widget.editing
                    ? 'EDITAR DEPENDENTE'
                    : 'ADICIONAR DEPENDENTE')
                : Text('SALVANDO'),
            icon: !state.saving
                ? (widget.editing ? Icon(Icons.edit) : Icon(Icons.add))
                : null),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }));
  }

  Widget input(
      {@required TextEditingController controller, @required String label}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: label)));
  }

  _setGenre(bool isMale) {
    setState(() {
      this.isMale = isMale;
    });
  }

  _setBirthday(DateTime picked) {
    setState(() {
      this.birthday = picked;
    });
  }

  _onSubmit() {
    BlocProvider.of<AddPersonBloc>(context).dispatch(widget.editing
        ? Edit(
            id: widget.person.id,
            name: name.text,
            birthday: birthday,
            isMale: isMale)
        : Register(name: name.text, birthday: birthday, isMale: isMale));
  }
}
