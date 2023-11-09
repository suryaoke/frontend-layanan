class UserSiswaModel {
  final int? id;
  final String? email;
  final String? last;
  final String? profileImage;

  UserSiswaModel({
    this.id,
    this.email,
    this.last,
    this.profileImage,
  });

  factory UserSiswaModel.fromJson(Map<String, dynamic> json) {
    return UserSiswaModel(
      id: json['id'],
      email: json['email'],
      last: json['last'],
      profileImage: json['profile_image'],
    );
  }
}
