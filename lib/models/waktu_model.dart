class WaktuModel {
  final int? id;
  final String? kodewaktu;
  final String? range;

  WaktuModel({
    this.id,
    this.kodewaktu,
    this.range,
  });

  factory WaktuModel.fromJson(Map<String, dynamic> json) {
    return WaktuModel(
      id: json['id'],
      kodewaktu: json['kode_waktu'],
      range: json['range'],
    );
  }
}
