import 'package:layanan/models/siswa_model.dart';

class AbsensiDataModel {
  final int? id;
  final int? alfa;
  final int? izin;
  final int? sakit;
  final SiswaModel? siswaModel;

  AbsensiDataModel(
      {this.id, this.siswaModel, this.alfa, this.izin, this.sakit});

  factory AbsensiDataModel.fromJson(Map<String, dynamic> json) {
    return AbsensiDataModel(
      id: json['id'],
      alfa: json['alfa'],
      izin: json['izin'],
      sakit: json['sakit'],
      siswaModel:
          json['siswa'] == null ? null : SiswaModel.fromJson(json['siswa']),
    );
  }
}
