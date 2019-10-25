import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/booklet_model.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:meta/meta.dart';

@immutable
class AddPersonState extends Equatable {
  final bool saving;
  final bool registred;
  final bool deleted;

  AddPersonState({
    this.registred = false,
    this.saving = false,
    this.deleted = false,
  }) : super([registred, saving, deleted]);

  factory AddPersonState.initial() {
    return AddPersonState();
  }

  AddPersonState copyWith({bool registred, bool saving, bool deleted}) {
    return AddPersonState(
        registred: registred == null ? this.registred : registred,
        saving: saving == null ? this.saving : saving,
        deleted: deleted == null ? this.deleted : deleted);
  }
}
