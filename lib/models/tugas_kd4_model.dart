import 'package:layanan/models/mapel_model.dart';
import 'package:layanan/models/nilaikd4_model.dart';
import 'package:layanan/models/siswa_model.dart';

class TugasKd4Model {
  final int? id;
  final String? nilai;
  final String? remedial;
  final String? feedback;
  final String? status;
  final String? tugas;
  final String? tugasupload;
  final String? ket;
  final String? materi;
  final String? last;

  final SiswaModel? siswaModel;
  final MapelModel? mapelModel;
  final Nilaikd4Model? nilaikd4Model;

  TugasKd4Model(
      {this.id,
      this.nilai,
      this.remedial,
      this.feedback,
      this.status,
      this.tugas,
      this.tugasupload,
      this.ket,
      this.materi,
      this.last,
      this.siswaModel,
      this.mapelModel,
      this.nilaikd4Model});

  factory TugasKd4Model.fromJson(Map<String, dynamic> json) {
    return TugasKd4Model(
      id: json['id'],
      nilai: json['nilai'],
      remedial: json['remedial'],
      feedback: json['feedback'],
      status: json['status'],
      tugas: json['tugas'],
      tugasupload: json['tugas_upload'],
      ket: json['ket'],
      materi: json['materi'],
      last: json['last'],
      siswaModel:
          json['siswa'] == null ? null : SiswaModel.fromJson(json['siswa']),
      mapelModel:
          json['mapel'] == null ? null : MapelModel.fromJson(json['mapel']),
      nilaikd4Model: json['nilaikd4'] == null
          ? null
          : Nilaikd4Model.fromJson(json['nilaikd4']),
    );
  }
}
