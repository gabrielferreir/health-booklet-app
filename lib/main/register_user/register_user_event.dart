import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterUserEvent extends Equatable {
  RegisterUserEvent([List props = const []]) : super(props);
}

class Register extends RegisterUserEvent {
  String name;
  String lastName;
  String email;
  String pass;
  DateTime birthday;
  bool isMale;

  Register(
      {@required this.name,
      @required this.lastName,
      @required this.email,
      @required this.pass,
      this.birthday,
      this.isMale});
}
