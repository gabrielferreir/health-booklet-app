import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class PercentagemItem extends Equatable implements Object {
  final int id;
  final String person;
  final String booklet;
  final int total;
  final int taken;

  PercentagemItem(this.id, this.person, this.booklet, this.total, this.taken);

  static fromJSON(json) {
    print(json);
    return new PercentagemItem(json['id'], json['person'], json['booklet'],
        json['total'], json['taken']);
  }
}
