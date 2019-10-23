import 'package:equatable/equatable.dart';
import 'package:health_booklet/models/user_model.dart';
import 'package:meta/meta.dart';

@immutable
class ProfileState extends Equatable {
  final bool loading;
  final User user;

  ProfileState({this.loading = false, this.user}) : super([loading, user]);

  ProfileState copyWith({bool loading, User user}) {
    print('copyWith $user');
    return ProfileState(
        loading: loading == null ? this.loading : loading,
        user: user ?? this.user);
  }
}
