class SignUpFormModel {
  final String? name;
  final String? email;

  SignUpFormModel({
    this.name,
    this.email,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'email': 'email'};
  }
}
