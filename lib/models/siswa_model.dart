import 'package:layanan/models/jurusan_model.dart';
import 'package:layanan/models/kelas_model.dart';
import 'package:layanan/models/user_siswa_model.dart';

class SiswaModel {
  final int? id;
  final String? nama;
  final String? nisn;
  final KelasModel? kelasModel;
  final JurusanModel? jurusanModel;
  final UserSiswaModel? userSiswaModel;

  SiswaModel(
      {this.id,
      this.nama,
      this.nisn,
      this.kelasModel,
      this.jurusanModel,
      this.userSiswaModel});

  factory SiswaModel.fromJson(Map<String, dynamic> json) {
    return SiswaModel(
      id: json['id'],
      nama: json['nama'],
      nisn: json['nisn'],
      kelasModel:
          json['kelas'] == null ? null : KelasModel.fromJson(json['kelas']),
      jurusanModel: json['jurusan'] == null
          ? null
          : JurusanModel.fromJson(json['jurusan']),
      userSiswaModel:
          json['user'] == null ? null : UserSiswaModel.fromJson(json['user']),
    );
  }
}
