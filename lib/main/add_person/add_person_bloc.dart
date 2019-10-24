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
        print(event);
        yield currentState.copyWith(saving: true);
        await personRepository.create(
            name: event.name, birthday: event.birthday, isMale: event.isMale);
        yield currentState.copyWith(saving: false, registred: true);
      } catch (e) {
        print('error $e');
        yield currentState.copyWith(saving: false);
      }
    }
  }
}
