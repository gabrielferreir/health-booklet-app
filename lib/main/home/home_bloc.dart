import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:health_booklet/repository/person_booklet.dart';
import 'package:meta/meta.dart';
import 'home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PersonBookletRepository personBookletRepository;

  HomeBloc({@required this.personBookletRepository});

  @override
  HomeState get initialState => HomeState.initial();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is Started) {
      try {
        print('STARTED');
        yield currentState.copyWith(loading: true);
        final percentage = await personBookletRepository.percentage();
        print(percentage);
        final nextVaccines = await personBookletRepository.nextVaccines();
        print(nextVaccines);
        yield currentState.copyWith(
            loading: false,
            listPercentage: percentage,
            listVaccine: nextVaccines);
      } catch (e) {
        print(e);
        yield currentState.copyWith(loading: false);
      }
    }
  }
}
