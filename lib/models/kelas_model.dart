class KelasMethodModel {
  final int? id;
  final String? nama;
  final String? tingkat;

  KelasMethodModel({
    this.id,
    this.nama,
    this.tingkat,
  });

  factory KelasMethodModel.fromJson(Map<String, dynamic> json) {
    return KelasMethodModel(
      id: json['result']['kelas']['id'],
      nama: json['result']['kelas']['nama'],
      tingkat: json['result']['kelas']['tingkat'],
    );
  }
}
