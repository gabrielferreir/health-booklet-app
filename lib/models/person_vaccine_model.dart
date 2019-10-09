import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/vaccine_model.dart';
import 'package:meta/meta.dart';

@immutable
class PersonVaccine extends Equatable implements Object {
  final int id;
  final DateTime minDate;
  final DateTime maxDate;
  final bool isOkay;
  final Vaccine vaccine;

  PersonVaccine(this.id, this.minDate, this.maxDate, this.isOkay, this.vaccine);

  static fromJSON(json) {
    return new PersonVaccine(
        json['id'],
        DateTime.parse(json['minDate']),
        DateTime.parse(json['maxDate']),
        json['isOkay'],
        Vaccine.fromJSON(json['vaccine']));
  }
}
