import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/add_person/add_person.dart';
import 'package:health_booklet/main/register_user/components/DateField.dart';
import 'package:health_booklet/main/register_user/components/Genre.dart';

class AddPersonContent extends StatefulWidget {
  @override
  _AddPersonContentState createState() => _AddPersonContentState();
}

class _AddPersonContentState extends State<AddPersonContent> {
  DateTime birthday = DateTime.now();
  bool isMale = true;
  final TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddPersonBloc, AddPersonState>(
        listener: (context, state) {
          print('state $state');
          if(state.registred)
            Navigator.pop(context, true);
        },
        child: BlocBuilder<AddPersonBloc, AddPersonState>(
            builder: (context, state) {
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
                    ? Text('ADICIONAR DEPENDENTE')
                    : Text('SALVANDO'),
                icon: !state.saving ? Icon(Icons.add) : null),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
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
    print('_onSubmit');
    BlocProvider.of<AddPersonBloc>(context).dispatch(
        Register(name: name.text, birthday: birthday, isMale: isMale));
  }
}
