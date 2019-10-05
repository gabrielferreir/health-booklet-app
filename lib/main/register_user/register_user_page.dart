import 'package:health_booklet/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_user.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  RegisterUserBloc registerUserBloc;
  final name = TextEditingController();
  final lastName = TextEditingController();
  final login = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  DateTime birthday = DateTime.now();
  bool isMale = true;

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

  @override
  void initState() {
    this.registerUserBloc = RegisterUserBloc(userRepository: UserRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: registerUserBloc,
      builder: (context, RegisterUserState state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: !state.loading ? _submit : null,
                child: state.loading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                    : Icon(Icons.save)),
            body: RegisterUserContent(
              registerUserBloc: registerUserBloc,
              name: name,
              lastName: lastName,
              pass: pass,
              email: email,
              isMale: isMale,
              isMaleCallback: _setGenre,
              birthday: birthday,
              birthdayCallback: _setBirthday,
            ));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _submit() {
    registerUserBloc.dispatch(Register(
        name: name.text,
        lastName: lastName.text,
        email: email.text,
        pass: pass.text,
        birthday: birthday,
        isMale: isMale));
  }
}
