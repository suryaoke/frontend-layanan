class KelasModel {
  final int? id;
  final String? nama;
  final String? tingkat;

  KelasModel({
    this.id,
    this.nama,
    this.tingkat,
  });

  factory KelasModel.fromJson(Map<String, dynamic> json) {
    return KelasModel(
      id: json['id'],
      nama: json['nama'],
      tingkat: json['tingkat'],
    );
  }
}
