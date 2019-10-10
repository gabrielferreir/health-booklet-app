import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/person_vaccine_model.dart';
import 'package:meta/meta.dart';

@immutable
class VaccinesBookletState extends Equatable {
  final bool loading;
  final bool sending;
  final bool sended;
  final List<PersonVaccine> vaccines;

  VaccinesBookletState(
      {this.loading = false,
      this.sending = false,
      this.sended = false,
      this.vaccines = const []})
      : super([loading, sending, sended, vaccines]);

  factory VaccinesBookletState.initial() {
    return VaccinesBookletState();
  }

  VaccinesBookletState copyWith(
      {bool loading, bool sending, bool sended, List<PersonVaccine> vaccines}) {
    return VaccinesBookletState(
        loading: loading == null ? this.loading : loading,
        sending: sending == null ? this.sending : sending,
        sended: sended == null ? this.sended : sended,
        vaccines: vaccines ?? this.vaccines);
  }
}
