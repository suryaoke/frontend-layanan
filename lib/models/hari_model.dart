class HariModel {
  final int? id;
  final String? kodehari;
  final String? nama;

  HariModel({
    this.id,
    this.kodehari,
    this.nama,
  });

  factory HariModel.fromJson(Map<String, dynamic> json) {
    return HariModel(
      id: json['id'],
      kodehari: json['kode_hari'],
      nama: json['nama'],
    );
  }
}
