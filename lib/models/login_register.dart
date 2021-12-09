import 'dart:convert';

LoginUser loginUserFromMap(String str) => LoginUser.fromMap(json.decode(str));

String loginUserToMap(LoginUser data) => json.encode(data.toMap());

class LoginUser {
  LoginUser({
    required this.app,
    required this.login,
    required this.password,
  });

  final String app;
  final String login;
  final String password;

  factory LoginUser.fromMap(Map<String, dynamic> json) => LoginUser(
        app: json["app"],
        login: json["login"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "app": app,
        "login": login,
        "password": password,
      };
}
