import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layanan/models/tugas_kd3_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class TugasKd3Service {
  Future<List<TugasKd3Model>> getTugasKd3s() async {
    try {
      final token = await AuthService().getToken();

      var response = await http.get(
        Uri.parse('$baseUrl/tugas/kd3'),
        headers: {
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body)['kd3'];
        List<TugasKd3Model> tugaskd3List =
            List<TugasKd3Model>.from(jsonData.map((x) => TugasKd3Model.fromJson(x)));
        return tugaskd3List;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
