class SiswaModel {
  final int? id;
  final String? nama;
  final String? nisn;

  SiswaModel({
    this.id,
    this.nama,
    this.nisn,
  });

  factory SiswaModel.fromJson(Map<String, dynamic> json) {
    return SiswaModel(
      id: json['id'],
      nama: json['nama'],
      nisn: json['nisn'],
    );
  }
}
