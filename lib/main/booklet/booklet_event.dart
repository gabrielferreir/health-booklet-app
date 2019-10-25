import 'package:meta/meta.dart';

@immutable
abstract class BookletEvent {}

class Started extends BookletEvent {}

class Delete extends BookletEvent {
  final int id;

  Delete({@required this.id});
}
