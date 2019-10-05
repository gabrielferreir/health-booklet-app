import 'package:health_booklet/core/api/api.dart';
import 'package:health_booklet/core/api/api_response.dart';
import 'package:health_booklet/core/exceptions/exceptions.dart';
import 'package:health_booklet/models/user_model.dart';
import 'package:health_booklet/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  ApiService api;

  AuthRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<User> login({@required email, @required pass}) async {
    ApiResponse response = await api.request(
        method: Method.post,
        path: '/user/login',
        body: {'email': email, 'pass': pass});

    if (response.statusCode == 200)
      return User(email: email, token: response.body['token']);
    if (response.statusCode == 404) return throw NotFoundException();
    return throw UnknownException();
  }
}
