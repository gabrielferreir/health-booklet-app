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

class Edit extends AddPersonEvent {
  final int id;
  final String name;
  final DateTime birthday;
  final bool isMale;

  Edit(
      {@required this.id,
      @required this.name,
      @required this.birthday,
      @required this.isMale});
}

class Delete extends AddPersonEvent {
  final int id;

  Delete({@required this.id});
}
