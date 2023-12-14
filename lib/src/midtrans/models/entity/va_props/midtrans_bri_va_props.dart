class MidtransBriVaProps {
  /// Custom VA number assigned by you. If shorter than minimum then Midtrans will add trailing 0s as most significant bits. If longer than maximum then Midtrans will trim the remaining least significant bits.
  ///
  /// BRI VA: Accepts 18 digits.
  final String? vaNumber;

  MidtransBriVaProps({
    this.vaNumber,
  });

  factory MidtransBriVaProps.fromJson(Map<String, dynamic> json) =>
      MidtransBriVaProps(
        vaNumber: json["va_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank": "bri",
        "va_number": vaNumber,
      };
}
