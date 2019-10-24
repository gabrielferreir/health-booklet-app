import 'package:meta/meta.dart';

@immutable
abstract class AddPersonEvent {}

class Register extends AddPersonEvent {
  final String name;
  final DateTime birthday;
  final bool isMale;

  Register(
      {@required this.name, @required this.birthday, @required this.isMale});
}
