import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:health_booklet/models/user_model.dart';
import 'package:health_booklet/repository/user_repository.dart';
import 'package:meta/meta.dart';

class UserService {
  static User _user;

  User get user {
    return _user;
  }

  set user(usr) {
    _user = usr;
  }

  String get token => this.user?.token;

  Future<void> logout({@required Preferences prefs}) async {
    final _prefs = await prefs.instance();
    await _prefs.remove('token');
    await _prefs.remove('email');
  }

  Future<void> save(
      {@required Preferences prefs,
      @required String token,
      @required String email}) async {
    final _prefs = await prefs.instance();
    await _prefs.setString('token', token);
    await _prefs.setString('email', email);
  }

  Future<User> read({@required Preferences prefs}) async {
    final _prefs = await prefs.instance();
    final token = _prefs.getString('token');
    final email = _prefs.getString('email');
    this.user = User(token: token, email: email);
    if (token == null) return null;
    final userRepository = UserRepository();
    final myUser = await userRepository.read();
    return User(
        firstName: myUser.firstName,
        token: token,
        email: email,
        birthday: myUser.birthday,
        isMale: myUser.isMale,
        lastName: myUser.lastName);
  }
}
