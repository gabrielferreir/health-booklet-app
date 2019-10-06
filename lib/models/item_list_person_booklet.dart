import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class ItemListPersonBooklet extends Equatable implements Object {
  final int id;
  final String person;
  final String booklet;

  ItemListPersonBooklet(this.id, this.person, this.booklet);

  static fromJSON(json) {
    return new ItemListPersonBooklet(
        json['id'], json['namePerson'], json['nameBooklet']);
  }
}
