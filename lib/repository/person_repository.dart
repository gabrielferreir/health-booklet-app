import 'package:health_booklet/core/api/api.dart';
import 'package:health_booklet/core/api/api_response.dart';
import 'package:health_booklet/core/exceptions/exceptions.dart';
import 'package:health_booklet/models/booklet_model.dart';
import 'package:health_booklet/models/item_list_person_booklet.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:health_booklet/models/user_model.dart';
import 'package:health_booklet/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class PersonRepository {
  ApiService api;

  PersonRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  create(
      {@required String name,
      @required DateTime birthday,
      @required bool isMale}) async {
    ApiResponse response = await api.request(
        method: Method.post,
        path: '/person',
        body: {
          'name': name,
          'birthday': birthday.toIso8601String(),
          'isMale': isMale
        });

    print(response.statusCode);

    if (response.statusCode == 201) return true;
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
