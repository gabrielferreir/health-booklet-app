import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/booklet_model.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:health_booklet/models/person_vaccine_model.dart';
import 'package:meta/meta.dart';

@immutable
class VaccinesBookletState extends Equatable {
  final bool loading;
  final List<PersonVaccine> vaccines;

  VaccinesBookletState({this.loading = false, this.vaccines = const []})
      : super([loading, vaccines]);

  factory VaccinesBookletState.initial() {
    return VaccinesBookletState();
  }

  VaccinesBookletState copyWith({bool loading, List<PersonVaccine> vaccines}) {
    return VaccinesBookletState(
        loading: loading == null ? this.loading : loading,
        vaccines: vaccines ?? this.vaccines);
  }
}
