import 'package:health_booklet/main/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_booklet/main/register_user/components/DateField.dart';
import 'components/Genre.dart';
import 'register_user.dart';

class RegisterUserContent extends StatefulWidget {
  final RegisterUserBloc registerUserBloc;
  final TextEditingController name;
  final TextEditingController lastName;
  final TextEditingController email;
  final TextEditingController pass;
  final Function isMaleCallback;
  final bool isMale;
  final DateTime birthday;
  final Function birthdayCallback;

  RegisterUserContent({@required this.registerUserBloc,
    @required this.name,
    @required this.lastName,
    @required this.email,
    @required this.pass,
    @required this.isMaleCallback,
    @required this.isMale,
    @required this.birthday,
    @required this.birthdayCallback});

  @override
  _RegisterUserContentState createState() => _RegisterUserContentState();
}

class _RegisterUserContentState extends State<RegisterUserContent> {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: widget.registerUserBloc,
        listener: (context, RegisterUserState state) {
          if (!state.loading) {
            _showExceptions(state.stateRegister);
            if (state.stateRegister == StateRegister.registered) _goToLogin();
          }
        },
        child: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
          input(label: 'Nome', controller: widget.name),
          input(label: 'Sobrenome', controller: widget.lastName),
          input(label: 'E-mail', controller: widget.email),
          input(label: 'Senha', controller: widget.pass),
          DateField(callback: widget.birthdayCallback, selectedDate: widget.birthday),
          Genre(callback: widget.isMaleCallback, isMale: widget.isMale)
        ]));
  }

  Widget input(
      {@required TextEditingController controller, @required String label}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: label)));
  }

  void _showExceptions(StateRegister stateRegister) {
    if (stateRegister == StateRegister.invalid)
      _showSnackbar('Esse login já foi utilizado');
    if (stateRegister == StateRegister.unknown)
      _showSnackbar('Tivemos um problema tente novamente mais tarde');
  }

  void _showSnackbar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _goToLogin() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName('/root'));
  }
}
