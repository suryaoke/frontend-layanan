import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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
        user = user.copyWith(password: data.password);
        await storeCredentialToLocal(user);

        return user;
      } else if (res.statusCode == 401) {
        throw Exception('Hanya bisa akses di web.');
      } else {
        throw Exception('Authentication failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentialToLocal(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'username', value: user.username);
      await storage.write(key: 'password', value: user.password);
      await storage.write(key: 'token', value: user.token);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentialFromLocal() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();
      if (values['username'] == null || values['password'] == null) {
        throw 'ap';
      } else {
        final SignInFormModel data = SignInFormModel(
          username: values['username'],
          password: values['password'],
        );
        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';
    const storage = FlutterSecureStorage();
    String? value = await storage.read(key: 'token');
    if (value != null) {
      token = 'Bearer ' + value;
    }
    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }

  Future<void> logout() async {
    try {
      final token = await getToken();
      final res = await http.post(Uri.parse('$baseUrl/logout'), headers: {
        'Authorization': token,
      });
      if (res.statusCode == 200) {
        await clearLocalStorage();
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
