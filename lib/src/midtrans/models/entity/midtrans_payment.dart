class MidtransPayment {
  /// Free text message in Bahasa Indonesia.
  final String? id;

  /// Free text message in English.
  final String? en;

  MidtransPayment({
    this.id,
    this.en,
  });

  factory MidtransPayment.fromJson(Map<String, dynamic> json) =>
      MidtransPayment(
        id: json["id"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "en": en,
      };
}
