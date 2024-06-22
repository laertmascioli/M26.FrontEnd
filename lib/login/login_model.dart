class LoginModel {
  final String username;
  final String password;
  final String token;

  LoginModel({
    required this.username,
    required this.password,
    this.token = "",
  });
}
