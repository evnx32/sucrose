class MidtransInquiry {
  /// Free text message in Bahasa Indonesia.
  final String? id;

  /// Free text message in English.
  final String? en;

  MidtransInquiry({
    this.id,
    this.en,
  });

  factory MidtransInquiry.fromJson(Map<String, dynamic> json) =>
      MidtransInquiry(
        id: json["id"],
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "en": en,
      };
}
