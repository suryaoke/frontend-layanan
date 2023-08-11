import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:layanan/models/sign_in_form_model.dart';
import 'package:layanan/models/user_model.dart';
import 'package:layanan/shared/shared_values.dart';

class AuthService {
  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: data.toJson(),
      );
      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copywith(password: data.password);
        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
