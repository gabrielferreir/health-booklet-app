import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/item_list_person_booklet.dart';
import 'package:meta/meta.dart';

@immutable
class BookletState extends Equatable {
  final bool loading;
  final bool deleting;
  final List<ItemListPersonBooklet> list;

  BookletState({this.loading = false, this.deleting, this.list = const []})
      : super([loading, list, deleting]);

  factory BookletState.initial() {
    return BookletState();
  }

  BookletState copyWith(
      {bool loading, bool deleting, List<ItemListPersonBooklet> list}) {
    return BookletState(
        list: list ?? this.list,
        loading: loading == null ? this.loading : loading,
        deleting: deleting == null ? this.deleting : deleting);
  }
}
