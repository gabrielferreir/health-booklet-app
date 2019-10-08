import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Booklet extends Equatable implements Object {
  final int id;
  final String name;
  final String description;

  Booklet(this.id, this.name, this.description);

  static fromJSON(json) {
    return new Booklet(json['id'], json['name'], json['description']);
  }
}
