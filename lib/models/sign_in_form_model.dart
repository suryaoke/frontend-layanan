class SignInFormModel {
  final String? username;
  final String? password;

  SignInFormModel({
    this.username,
    this.password,
  });
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
