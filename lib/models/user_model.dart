import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class User extends Equatable implements Object {
  final String email;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final bool isMale;
  final String token;

  User.fromJSON(Map<String, dynamic> json)
      : this.email = json['email'],
        this.firstName = json['firstName'],
        this.lastName = json['lastName'],
        this.birthday =
            json['birthday'] != null ? DateTime.parse(json['birthday']) : null,
        this.isMale = json['isMale'],
        this.token = json['token'];

  User(
      {this.email,
      this.token,
      this.firstName,
      this.lastName,
      this.birthday,
      this.isMale});

  @override
  String toString() {
    return 'User $firstName $email $token';
  }
}
