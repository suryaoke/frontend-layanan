import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layanan/models/siswa_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class SiswaService {
  Future<List<SiswaModel>> getSiswas() async {
    try {
      final token = await AuthService().getToken();

      var response = await http.get(
        Uri.parse('$baseUrl/siswa'),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['siswa'];
        return data.map((siswa) => SiswaModel.fromJson(siswa)).toList();
      }

      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
