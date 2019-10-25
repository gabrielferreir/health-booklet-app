import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:health_booklet/main/add_person/add_person.dart';
import 'package:health_booklet/repository/person_repository.dart';
import 'package:meta/meta.dart';

class AddPersonBloc extends Bloc<AddPersonEvent, AddPersonState> {
  final PersonRepository personRepository;

  AddPersonBloc({@required this.personRepository});

  @override
  AddPersonState get initialState => AddPersonState.initial();

  @override
  Stream<AddPersonState> mapEventToState(AddPersonEvent event) async* {
    if (event is Register) {
      try {
        yield currentState.copyWith(saving: true);
        await personRepository.create(
            name: event.name, birthday: event.birthday, isMale: event.isMale);
        yield currentState.copyWith(saving: false, registred: true);
      } catch (e) {
        yield currentState.copyWith(saving: false);
      }
    }

    if (event is Edit) {
      try {
        yield currentState.copyWith(saving: true);
        await personRepository.update(
            id: event.id,
            name: event.name,
            birthday: event.birthday,
            isMale: event.isMale);
        yield currentState.copyWith(saving: false, registred: true);
      } catch (e) {
        print(e);
        yield currentState.copyWith(saving: false);
      }
    }

    if (event is Delete) {
      try {
        yield currentState.copyWith(saving: true);
        await personRepository.delete(id: event.id);
        yield currentState.copyWith(saving: false, deleted: true);
      } catch (e) {
        print(e);
        yield currentState.copyWith(saving: false);
      }
    }
  }
}
