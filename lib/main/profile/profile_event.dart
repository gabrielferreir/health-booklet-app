import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ProfileEvent extends Equatable {
  ProfileEvent([List props = const []]) : super(props);
}

class Started extends ProfileEvent {}
