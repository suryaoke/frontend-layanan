class GuruModel {
  final int? id;
  final String? nama;
  final String? kodegr;

  GuruModel({
    this.id,
    this.nama,
    this.kodegr,
  });

  factory GuruModel.fromJson(Map<String, dynamic> json) {
    return GuruModel(
      id: json['id'],
      nama: json['nama'],
      kodegr: json['kode_gr'],
    );
  }
}
