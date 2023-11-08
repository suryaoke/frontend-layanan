import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layanan/models/jadwal_mapel_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class JadwalMapelService {
  Future<List<JadwalmapelModel>> getJadwalMapels() async {
    try {
      final token = await AuthService().getToken();

      var response = await http.get(
        Uri.parse('$baseUrl/jadwalmapel'),
        headers: {
          'Authorization': token,
        },
      );
      if (response.statusCode == 200) {
        List<dynamic> jadwalData = jsonDecode(response.body)['jadwal'];
        List<JadwalmapelModel> jadwalList =
            jadwalData.map((item) => JadwalmapelModel.fromJson(item)).toList();
        return jadwalList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
