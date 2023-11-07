class InfoModel {
  final int? id;
  final String? nama;
  final String? ket;
  final String? link;
  final String? image;

  const InfoModel({
    this.id,
    this.nama,
    this.ket,
    this.link,
    this.image,
  });

  factory InfoModel.fromJson(Map<String, dynamic> json) {
    return InfoModel(
      id: json['id'],
      nama: json['nama'],
      ket: json['ket'],
      link: json['link'],
      image: json['image'],
    );
  }
}


