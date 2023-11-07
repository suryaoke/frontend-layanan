class MapelModel {
  final int? id;
  final String? nama;

  MapelModel({
    this.id,
    this.nama,
  });

  factory MapelModel.fromJson(Map<String, dynamic> json) {
    return MapelModel(
      id: json['id'],
      nama: json['nama'],
    );
  }
}
