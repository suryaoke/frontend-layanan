import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:layanan/models/user_edit_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();
      final response = await http.put(
        Uri.parse('$baseUrl/update-user'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to update user profile');
      }
    } catch (e) {
      rethrow;
    }
  }
}
