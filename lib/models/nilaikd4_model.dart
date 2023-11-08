class Nilaikd4Model {
  final int? id;
  final String? ph;

  Nilaikd4Model({
    this.id,
    this.ph,
  });

  factory Nilaikd4Model.fromJson(Map<String, dynamic> json) {
    return Nilaikd4Model(
      id: json['id'],
      ph: json['ph'],
    );
  }
}
