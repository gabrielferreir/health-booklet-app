import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:health_booklet/repository/person_booklet.dart';
import './booklet.dart';

class BookletBloc extends Bloc<BookletEvent, BookletState> {
  @override
  BookletState get initialState => BookletState.initial();

  @override
  Stream<BookletState> mapEventToState(
    BookletEvent event,
  ) async* {
    if (event is Started) {
      try {
        yield currentState.copyWith(loading: true);
        final personBookletRepository = new PersonBookletRepository();
        final list = await personBookletRepository.readBooklet();
        yield currentState.copyWith(loading: false, list: list);
      } catch (e) {
        print(e);
      }
    }
  }
}
