import 'package:health_booklet/core/api/api.dart';
import 'package:health_booklet/core/api/api_response.dart';
import 'package:health_booklet/core/exceptions/exceptions.dart';
import 'package:health_booklet/models/item_list_person_booklet.dart';
import 'package:health_booklet/models/user_model.dart';
import 'package:health_booklet/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class PersonBookletRepository {
  ApiService api;

  PersonBookletRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  readAll() async {
    ApiResponse response =
        await api.request(method: Method.get, path: '/person-booklet-list');

    if (response.statusCode == 200)
      return List<ItemListPersonBooklet>.from(response.body
          .map((item) => ItemListPersonBooklet.fromJSON(item))
          .toList());
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
