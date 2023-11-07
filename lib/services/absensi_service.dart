import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layanan/models/absensi_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class AbsensiService {
  Future<List<AbsensiModel>> getAbsensis() async {
    try {
      final token = await AuthService().getToken();

      var response = await http.get(
        Uri.parse('$baseUrl/absensi'),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['absensi'];
        return data.map((absensi) => AbsensiModel.fromJson(absensi)).toList();
      }

      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
