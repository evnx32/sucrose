class MidtransGopayBalance {
  /// The value of the balance.
  final String? value;

  /// The currency of the balance.
  final String? currency;

  MidtransGopayBalance({
    this.value,
    this.currency,
  });

  factory MidtransGopayBalance.fromJson(Map<String, dynamic> json) =>
      MidtransGopayBalance(
        value: json["value"],
        currency: json["currency"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "currency": currency,
      };
}
