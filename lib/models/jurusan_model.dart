class JurusanModel {
  final int? id;
  final String? nama;


  JurusanModel({
    this.id,
    this.nama,

  });

  factory JurusanModel.fromJson(Map<String, dynamic> json) {
    return JurusanModel(
      id: json['id'],
      nama: json['nama'],

    );
  }
}
