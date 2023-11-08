import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layanan/models/kd4_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class Kd4Service {
  Future<List<Kd4Model>> getKd4s() async {
    try {
      final token = await AuthService().getToken();

      var response = await http.get(
        Uri.parse('$baseUrl/kd4'),
        headers: {
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> kd4Data = jsonDecode(response.body)['kd4'];
        List<Kd4Model> kd4List =
            kd4Data.map((item) => Kd4Model.fromJson(item)).toList();
        return kd4List;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
