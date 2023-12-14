class MidtransVaNumber {
  /// Bank name which processes bank transfer transaction.
  final String? bank;

  /// Virtual account number.
  final String? vaNumber;

  MidtransVaNumber({
    this.bank,
    this.vaNumber,
  });

  factory MidtransVaNumber.fromJson(Map<String, dynamic> json) =>
      MidtransVaNumber(
        bank: json["bank"],
        vaNumber: json["va_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank": bank,
        "va_number": vaNumber,
      };
}
