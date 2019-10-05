import 'package:health_booklet/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'register_user.dart';
import 'package:health_booklet/core/exceptions/exceptions.dart';

class RegisterUserBloc extends Bloc<RegisterUserEvent, RegisterUserState> {
  UserRepository userRepository;

  RegisterUserBloc({@required this.userRepository});

  @override
  RegisterUserState get initialState => RegisterUserState.initial();

  @override
  Stream<RegisterUserState> mapEventToState(RegisterUserEvent event) async* {
    if (event is Register) {
      yield currentState.copyWith(loading: true);
      try {
        await userRepository.register(
            name: event.name,
            lastName: event.lastName,
            birthday: event.birthday,
            pass: event.pass,
            email: event.email,
            isMale: event.isMale);
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.registered);
      } on BadRequestException {
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.invalid);
      } catch (e) {
        yield currentState.copyWith(
            loading: false, stateRegister: StateRegister.unknown);
      }
    }
  }
}
