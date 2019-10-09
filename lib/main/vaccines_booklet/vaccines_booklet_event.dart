import 'package:meta/meta.dart';

@immutable
abstract class VaccinesBookletEvent {}

class Started extends VaccinesBookletEvent {
  final int id;

  Started({@required this.id});
}
