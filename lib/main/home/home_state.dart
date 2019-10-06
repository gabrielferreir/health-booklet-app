import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState extends Equatable {
  final bool loading;
  final List list;

  HomeState({this.loading = false, this.list = const []})
      : super([loading, list]);

  factory HomeState.initial() {
    return HomeState();
  }

  HomeState copyWith({bool loading, List list}) {
    return HomeState(
        list: list ?? this.list,
        loading: loading == null ? this.loading : loading);
  }
}
