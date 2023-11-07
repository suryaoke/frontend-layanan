import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:layanan/models/info_model.dart';
import 'package:layanan/shared/shared_values.dart';
// Sesuaikan path dengan lokasi file InfoModel
// import 'package:layanan/shared/shared_values.dart'; // Anda perlu menyesuaikan impor ini dengan proyek Anda

class InfoService {
  Future<List<InfoModel>> getInfos() async {
    try {
      var response = await http.get(Uri.parse(
          '$baseUrl/info')); // Ganti YOUR_API_URL dengan URL yang sesuai
      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)['info'];
        return data.map((info) => InfoModel.fromJson(info)).toList();
      }
      throw jsonDecode(response.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
