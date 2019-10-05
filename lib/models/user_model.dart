import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class User extends Equatable implements Object {
  final String email;
  final String token;

  User.fromJSON(Map<String, dynamic> json)
      : this.email = json['email'],
        this.token = json['token'];

  User({this.email, this.token});

  @override
  String toString() {
    return 'User $email $token';
  }
}
