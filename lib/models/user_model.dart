class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? profileImage;
  final String? ttd;
  final String? jabatan;
  final String? role;
  final String? password;
  final String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profileImage,
    this.ttd,
    this.jabatan,
    this.role,
    this.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['result']['user']['id'],
      name: json['result']['user']['name'],
      email: json['result']['user']['email'],
      username: json['result']['user']['username'],
      profileImage: json['result']['user']['profile_image'],
      ttd: null,
      jabatan: null,
      role: json['result']['user']['role'],
      password: null,
      token: json['result']['user']['token'],
    );
  }

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? username,
    String? profileImage,
    String? ttd,
    String? jabatan,
    String? role,
    String? password,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      profileImage: profileImage ?? this.profileImage,
      ttd: ttd ?? this.ttd,
      jabatan: jabatan ?? this.jabatan,
      role: role ?? this.role,
      password: password ?? this.password,
      token: token ?? this.token,
    );
  }
}
