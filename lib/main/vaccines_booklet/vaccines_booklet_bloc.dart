import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:health_booklet/models/person_vaccine_model.dart';
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
        final vaccines = await personBookletRepository.readBookletById(id: event.id);
        yield currentState.copyWith(loading: false, vaccines: vaccines);
      } catch (e) {
        yield currentState.copyWith(loading: false);
      }
    }
    if (event is CheckVaccine) {
      try {
        yield currentState.copyWith(sended: false, sending: true);
        final personBookletRepository = new PersonBookletRepository();

        List<PersonVaccine> list = List.from(currentState.vaccines);
        final oldItem = list[event.index];
        final newItem = new PersonVaccine(oldItem.id, oldItem.minDate,
            oldItem.maxDate, !oldItem.isOkay, oldItem.vaccine);
        list[event.index] = newItem;

        await personBookletRepository.isOkay(
            idVaccine: event.idVaccine, value: event.value);

        yield currentState.copyWith(
            sended: true, sending: false, vaccines: list);
      } catch (e) {
        yield currentState.copyWith(sended: false, sending: false);
      }
    }
  }
}
