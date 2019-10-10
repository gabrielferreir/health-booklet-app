import 'package:meta/meta.dart';

@immutable
abstract class VaccinesBookletEvent {}

class Started extends VaccinesBookletEvent {
  final int id;

  Started({@required this.id});
}

class CheckVaccine extends VaccinesBookletEvent {
  final int idVaccine;
  final bool value;
  final int index;

  CheckVaccine({@required this.idVaccine, @required this.value, @required this.index});
}
