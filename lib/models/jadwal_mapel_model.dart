import 'package:layanan/models/guru_model.dart';
import 'package:layanan/models/hari_model.dart';
import 'package:layanan/models/mapel_model.dart';
import 'package:layanan/models/waktu_model.dart';

class JadwalmapelModel {
  final int? id;
  final String? kodejadwalmapel;

  final MapelModel? mapelModel;
  final WaktuModel? waktuModel;
  final HariModel? hariModel;
  final GuruModel? guruModel;

  JadwalmapelModel(
      {this.id,
      this.mapelModel,
      this.kodejadwalmapel,
      this.waktuModel,
      this.hariModel,
      this.guruModel});

  factory JadwalmapelModel.fromJson(Map<String, dynamic> json) {
    return JadwalmapelModel(
      id: json['id'],
      kodejadwalmapel: json['kode_jadwalmapel'],
      mapelModel:
          json['mapel'] == null ? null : MapelModel.fromJson(json['mapel']),
      waktuModel:
          json['waktu'] == null ? null : WaktuModel.fromJson(json['waktu']),
      hariModel: json['hari'] == null ? null : HariModel.fromJson(json['hari']),
      guruModel: json['guru'] == null ? null : GuruModel.fromJson(json['guru']),
    );
  }
}
