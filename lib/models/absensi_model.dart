import 'package:layanan/models/mapel_model.dart';
import 'package:layanan/models/siswa_model.dart';

class AbsensiModel {
  final int? id;
  final DateTime? tanggal;
  final String? status;
  final String? ket;
  final SiswaModel? siswaModel;
  final MapelModel? mapelModel;
  AbsensiModel(
      {this.id,
      this.tanggal,
      this.ket,
      this.status,
      this.siswaModel,
      this.mapelModel});

  factory AbsensiModel.fromJson(Map<String, dynamic> json) {
    return AbsensiModel(
      id: json['id'],
      status: json['status'],
      ket: json['ket'] ?? '-',
      tanggal: DateTime.parse(json['updated_at']),
      siswaModel:
          json['siswa'] == null ? null : SiswaModel.fromJson(json['siswa']),
      mapelModel:
          json['mapel'] == null ? null : MapelModel.fromJson(json['mapel']),
    );
  }
}
