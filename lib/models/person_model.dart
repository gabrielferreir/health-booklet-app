import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Person extends Equatable implements Object {
  final int id;
  final String name;
  final DateTime birthday;
  final bool isMale;

  Person(this.id, this.name, this.birthday, this.isMale);

  static fromJSON(json) {
    return new Person(json['id'], json['name'],
        DateTime.parse(json['birthday']), json['isMale']);
  }
}
