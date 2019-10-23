import 'package:bloc/bloc.dart';
import 'package:health_booklet/repository/user_repository.dart';
import 'package:health_booklet/services/user.dart';
import 'package:meta/meta.dart';

import 'profile.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepository userRepository;

  @override
  ProfileState get initialState => ProfileState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is Started) {
      try {
        yield currentState.copyWith(loading: true);
        userRepository = UserRepository();
        final user = await userRepository.read();
        print('BLOC $user');
        yield currentState.copyWith(loading: false, user: user);
      } catch (e) {
        yield currentState.copyWith(loading: false);
      }
    }
  }
}
