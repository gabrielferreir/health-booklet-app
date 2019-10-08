import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/booklet_model.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:meta/meta.dart';

@immutable
class AddBookletState extends Equatable {
  final bool loading;
  final int page;
  final List<Person> listPersonBooklet;
  final List<Booklet> listBooklet;
  final int selectedPerson;
  final int selectedBooklet;

  AddBookletState(
      {this.loading = false,
      this.page = 0,
      this.listPersonBooklet = const [],
      this.listBooklet = const [],
      this.selectedPerson,
      this.selectedBooklet})
      : super([
          loading,
          page,
          listPersonBooklet,
          listBooklet,
          selectedPerson,
          selectedBooklet
        ]);

  factory AddBookletState.initial() {
    return AddBookletState();
  }

  AddBookletState copyWith(
      {bool loading,
      int page,
      List<Person> listPersonBooklet,
      List<Booklet> listBooklet,
      int selectedPerson,
      int selectedBooklet}) {
    return AddBookletState(
        loading: loading == null ? this.loading : loading,
        listPersonBooklet: listPersonBooklet ?? this.listPersonBooklet,
        page: page ?? this.page,
        listBooklet: listBooklet ?? this.listBooklet,
        selectedPerson: selectedPerson ?? this.selectedPerson,
        selectedBooklet: selectedBooklet ?? this.selectedBooklet);
  }
}
