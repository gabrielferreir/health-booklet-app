import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class NextVaccineItem extends Equatable implements Object {
  final int id;
  final DateTime minDate;
  final DateTime maxDate;
  final String person;
  final String vaccine;

  NextVaccineItem(
      this.id, this.minDate, this.maxDate, this.person, this.vaccine);

  static fromJSON(json) {
    print(json);
    return new NextVaccineItem(json['id'], DateTime.parse(json['minDate']),
        DateTime.parse(json['maxDate']), json['person'], json['vaccine']);
  }
}
