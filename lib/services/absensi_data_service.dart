import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layanan/models/absensi_data_model.dart';
import 'package:layanan/services/auth_service.dart';
import 'package:layanan/shared/shared_values.dart';

class AbsensiDataService {
  Future<List<AbsensiDataModel>> getAbsensidatas() async {
    try {
      final token = await AuthService().getToken();

      var response = await http.get(
        Uri.parse('$baseUrl/absensi/data'),
        headers: {
          'Authorization': token,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        Map<String, dynamic> absensiData = data['absensi'];
        List<AbsensiDataModel> absensiList = [
          AbsensiDataModel.fromJson(absensiData)
        ];
        return absensiList;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
