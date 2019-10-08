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

class BookletRepository {
  ApiService api;

  BookletRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  read() async {
    ApiResponse response =
        await api.request(method: Method.get, path: '/booklet');

    if (response.statusCode == 200)
      return List<Booklet>.from(
          response.body.map((item) => Booklet.fromJSON(item)).toList());
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
