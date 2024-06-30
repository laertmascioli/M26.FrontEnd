import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginModel {
  final String user;
  final String password;
  // final String id;
  // final String name;
  // final String type;
  // final String expiration;
  // final String refreshToken;
  // final String refreshTokenExpiration;
  // final String token;

  LoginModel(this.user, this.password);
  // this.id,
  // this.name,
  // this.type,
  // this.expiration,
  // this.refreshToken,
  // this.refreshTokenExpiration,
  // this.token);

  LoginModel.fromJson(Map<String, dynamic> json)
      : user = json['user'] as String,
        password = json['password'] as String;
  // id = json['id'] as String,
  // name = json['name'] as String,
  // type = json['type'] as String,
  // expiration = json['expiration'] as String,
  // refreshToken = json['refreshToken'] as String,
  // refreshTokenExpiration = json['refreshTokenExpiration'] as String,
  // token = json['token'] as String;

  Map<String, dynamic> toJson() => {
        'user': user,
        'password': password,
        // 'id': id,
        // 'name': name,
        // 'type': type,
        // 'expiration': expiration,
        // 'refreshToken': refreshToken,
        // 'refreshTokenExpiration': refreshTokenExpiration,
        // 'token': token,
      };
}
