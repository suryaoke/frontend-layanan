import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:layanan/models/tugas_kd4_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class TugasKd4Service {
  Future<List<TugasKd4Model>> getTugasKd4s() async {
    try {
      final token = await AuthService().getToken();

      var response = await http.get(
        Uri.parse('$baseUrl/tugas/kd4'),
        headers: {
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> tugaskd4Data = jsonDecode(response.body)['kd4'];
        List<TugasKd4Model> tugaskd4List =
            tugaskd4Data.map((item) => TugasKd4Model.fromJson(item)).toList();
        return tugaskd4List;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
