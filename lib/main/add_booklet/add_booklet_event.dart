import 'package:meta/meta.dart';

@immutable
abstract class BookletEvent {}

class SearchPerson extends BookletEvent {}

class SelectedPerson extends BookletEvent {
  final int idPerson;

  SelectedPerson(this.idPerson);
}

class SelectedBooklet extends BookletEvent {
  final int idBooklet;

  SelectedBooklet(this.idBooklet);
}
