class MidtransBniVaProps {
  /// Custom VA number assigned by you. If shorter than minimum then Midtrans will add trailing 0s as most significant bits. If longer than maximum then Midtrans will trim the remaining least significant bits.
  ///
  /// `BNI VA`: Accepts 8 (For 5 digits Client ID) or 12 digits (For 3 digits Client ID).
  final String? vaNumber;

  MidtransBniVaProps({
    this.vaNumber,
  });

  factory MidtransBniVaProps.fromJson(Map<String, dynamic> json) =>
      MidtransBniVaProps(
        vaNumber: json["va_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank": "bni",
        "va_number": vaNumber,
      };
}
