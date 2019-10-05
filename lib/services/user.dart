import 'package:health_booklet/core/prefs/preferences.dart';
import 'package:health_booklet/models/user_model.dart';
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
    if (token == null) return null;
    return User(email: email, token: token);
  }
}
