class Login_Model {
  final String username;
  final String password;
  final String token;

  Login_Model({
    required this.username,
    required this.password,
    this.token = "",
  });
}
