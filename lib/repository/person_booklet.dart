import 'package:health_booklet/core/api/api.dart';
import 'package:health_booklet/core/api/api_response.dart';
import 'package:health_booklet/core/exceptions/exceptions.dart';
import 'package:health_booklet/models/item_list_person_booklet.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:health_booklet/models/person_model.dart';
import 'package:health_booklet/models/user_model.dart';
import 'package:health_booklet/models/person_vaccine_model.dart';
import 'package:health_booklet/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class PersonBookletRepository {
  ApiService api;

  PersonBookletRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  readBooklet() async {
    ApiResponse response =
        await api.request(method: Method.get, path: '/person-booklet-list');

    if (response.statusCode == 200)
      return List<ItemListPersonBooklet>.from(response.body
          .map((item) => ItemListPersonBooklet.fromJSON(item))
          .toList());
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }

  readBookletById() async {
    ApiResponse response =
        await api.request(method: Method.get, path: '/person-booklet/1');

    if (response.statusCode == 200) {
      List vaccines = response.body['vaccines'];
      print(vaccines.length);
      return List<PersonVaccine>.from(
          vaccines.map((item) => PersonVaccine.fromJSON(item)).toList());
    }
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }

  read() async {
    ApiResponse response =
        await api.request(method: Method.get, path: '/person');

    if (response.statusCode == 200)
      return List<Person>.from(
          response.body.map((item) => Person.fromJSON(item)).toList());
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }

  create({@required int idPerson, @required int idBooklet}) async {
    ApiResponse response = await api.request(
        method: Method.post,
        path: '/person-booklet/',
        body: {'idPerson': idPerson, 'idBooklet': idBooklet});

    if (response.statusCode == 200) return true;
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }

  isOkay({@required int idVaccine, @required bool value}) async {
    ApiResponse response = await api.request(
        method: Method.put,
        path: '/person-booklet/vaccine/$idVaccine',
        body: {'value': value});

    if (response.statusCode == 200) return true;
    return throw UnknownException();
  }

}
