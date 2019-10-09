import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Vaccine extends Equatable implements Object {
  final int id;
  final String name;
  final String dose;
  final String description;
  final int daysMin;
  final int daysMax;

  Vaccine(this.id, this.name, this.dose, this.description, this.daysMin,
      this.daysMax);

  static fromJSON(json) {
    return new Vaccine(json['id'], json['name'], json['dose'],
        json['description'], json['daysMin'], json['daysMax']);
  }
}
