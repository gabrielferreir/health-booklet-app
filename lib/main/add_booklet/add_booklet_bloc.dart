import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:health_booklet/repository/booklet_repository.dart';
import 'package:health_booklet/repository/person_booklet.dart';
import './add_booklet.dart';

class AddBookletBloc extends Bloc<BookletEvent, AddBookletState> {
  @override
  AddBookletState get initialState => AddBookletState.initial();

  @override
  Stream<AddBookletState> mapEventToState(BookletEvent event) async* {
    if (event is SearchPerson) {
      try {
        yield currentState.copyWith(loading: true);
        final personBookletRepository = new PersonBookletRepository();
        final bookletRepository = new BookletRepository();
        final listPersonBooklet = await personBookletRepository.read();
        final listBooklet = await bookletRepository.read();

        yield currentState.copyWith(
            loading: false,
            listPersonBooklet: listPersonBooklet,
            listBooklet: listBooklet);
      } catch (e) {
        print(e);
      }
    }

    if (event is SelectedPerson) {
      yield currentState.copyWith(selectedPerson: event.idPerson);
    }

    if (event is SelectedBooklet) {
      yield currentState.copyWith(selectedBooklet: event.idBooklet);
    }

    if (event is GoToBooklet) {
      yield currentState.copyWith(page: 1);
    }

    if (event is GoToPerson) {
      yield currentState.copyWith(page: 0);
    }

    if (event is Register) {
      try {
        yield currentState.copyWith(saving: true);
        final personBookletRepository = new PersonBookletRepository();
        await personBookletRepository.create(
            idPerson: event.idPerson, idBooklet: event.idBooklet);
        yield currentState.copyWith(saving: false, created: true);
      } catch (e) {
        yield currentState.copyWith(saving: false);
      }
    }
  }
}
