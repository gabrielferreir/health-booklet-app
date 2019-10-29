import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/next_vaccine_item.dart';
import 'package:health_booklet/models/percentage_item.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState extends Equatable {
  final bool loading;
  final List<PercentagemItem> listPercentage;
  final List<NextVaccineItem> listVaccine;

  HomeState(
      {this.loading = false,
      this.listPercentage = const [],
      this.listVaccine = const []})
      : super([loading, listPercentage, listVaccine]);

  factory HomeState.initial() {
    return HomeState(loading: true);
  }

  HomeState copyWith(
      {bool loading,
      List<PercentagemItem> listPercentage,
      List<NextVaccineItem> listVaccine}) {
    return HomeState(
        loading: loading == null ? this.loading : loading,
        listPercentage: listPercentage ?? this.listPercentage,
        listVaccine: listVaccine ?? this.listVaccine);
  }
}
