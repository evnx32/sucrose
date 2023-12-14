class MidtransCimbVaProps {
  /// Custom VA number assigned by you. If shorter than minimum then Midtrans will add trailing 0s as most significant bits. If longer than maximum then Midtrans will trim the remaining least significant bits.

  final String? vaNumber;

  MidtransCimbVaProps({
    this.vaNumber,
  });

  factory MidtransCimbVaProps.fromJson(Map<String, dynamic> json) =>
      MidtransCimbVaProps(
        vaNumber: json["va_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank": "cimb",
        "va_number": vaNumber,
      };
}
