import 'package:health_booklet/core/api/api.dart';
import 'package:health_booklet/core/api/api_response.dart';
import 'package:health_booklet/core/exceptions/exceptions.dart';
import 'package:health_booklet/models/user_model.dart';
import 'package:health_booklet/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class UserRepository {
  ApiService api;

  UserRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<User> register(
      {@required name,
      @required lastName,
      @required email,
      @required pass,
      @required DateTime birthday,
      @required isMale}) async {
    ApiResponse response =
        await api.request(method: Method.post, path: '/user', body: {
      'firstName': name,
      'lastName': lastName,
      'email': email,
      'pass': pass,
      'birthday': birthday.toIso8601String(),
      'isMale': isMale
    });

    if (response.statusCode == 201)
      return User(token: response.body['token'], email: email);
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
