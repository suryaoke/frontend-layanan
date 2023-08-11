import 'dart:convert';

class UserModel {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? profile_image;
  final String? ttd;
  final String? jabatan;
  final String? role;
  final String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profile_image,
    this.ttd,
    this.jabatan,
    this.role,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        profile_image: json['profile_image'],
        ttd: json['ttd'],
        jabatan: json['jabatan'],
        role: json['role'],
        password: json['password'],
      );

  UserModel copywith({
    final String? name,
    final String? email,
    final String? username,
    final String? profile_image,
    final String? ttd,
    final String? jabatan,
    final String? role,
    final String? password,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        email: email ?? this.email,
        username: username ?? this.username,
        profile_image: profile_image ?? this.profile_image,
        ttd: ttd ?? this.ttd,
        jabatan: jabatan ?? this.jabatan,
        role: role ?? this.role,
        password: password ?? this.password,
      );
}
