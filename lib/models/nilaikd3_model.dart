class Nilaikd3Model {
  final int? id;
  final String? ph;

  Nilaikd3Model({
    this.id,
    this.ph,
  });

  factory Nilaikd3Model.fromJson(Map<String, dynamic> json) {
    return Nilaikd3Model(
      id: json['id'],
      ph: json['ph'],
    );
  }
}
