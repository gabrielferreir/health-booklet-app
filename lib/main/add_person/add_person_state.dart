import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/booklet_model.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:meta/meta.dart';

@immutable
class AddPersonState extends Equatable {
  final bool saving;
  final bool registred;

  AddPersonState({
    this.registred = false,
    this.saving = false,
  }) : super([registred, saving]);

  factory AddPersonState.initial() {
    return AddPersonState();
  }

  AddPersonState copyWith({bool registred, bool saving}) {
    return AddPersonState(
        registred: registred == null ? this.registred : registred,
        saving: saving == null ? this.saving : saving);
  }
}
