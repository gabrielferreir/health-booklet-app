import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:health_booklet/repository/booklet_repository.dart';
import 'package:health_booklet/repository/person_booklet.dart';
import './vaccines_booklet.dart';

class VaccinesBookletBloc
    extends Bloc<VaccinesBookletEvent, VaccinesBookletState> {
  @override
  VaccinesBookletState get initialState => VaccinesBookletState.initial();

  @override
  Stream<VaccinesBookletState> mapEventToState(
      VaccinesBookletEvent event) async* {
    if (event is Started) {
      try {
        yield currentState.copyWith(loading: true);
        final personBookletRepository = new PersonBookletRepository();
        final vaccines = await personBookletRepository.readBookletById();
        yield currentState.copyWith(loading: false, vaccines: vaccines);
      } catch (e) {
        yield currentState.copyWith(loading: false);
      }
    }
  }
}
