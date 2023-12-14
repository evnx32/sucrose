class MidtransPermataVaProps {
  /// Custom VA number assigned by you. If shorter than minimum then Midtrans will add trailing 0s as most significant bits. If longer than maximum then Midtrans will trim the remaining least significant bits.
  ///
  /// Permata VA Facilitator: Accepts 10 digits.
  final String? vaNumber;

  /// Charge details using bank transfer.
  final MidtransPermata? permata;

  MidtransPermataVaProps({
    this.vaNumber,
    this.permata,
  });

  factory MidtransPermataVaProps.fromJson(Map<String, dynamic> json) =>
      MidtransPermataVaProps(
        vaNumber: json["va_number"],
        permata: json["permata"] == null
            ? null
            : MidtransPermata.fromJson(json["permata"]),
      );

  Map<String, dynamic> toJson() => {
        "bank": "permata",
        "va_number": vaNumber,
        "permata": permata?.toJson(),
      };
}

class MidtransPermata {
  /// Recipient name shown on the payment details. It is shown as 20 characters uppercase string.
  ///
  /// Note: Default is merchant name.
  final String? recipientName;

  MidtransPermata({
    this.recipientName,
  });

  factory MidtransPermata.fromJson(Map<String, dynamic> json) =>
      MidtransPermata(
        recipientName: json["recipient_name"],
      );

  Map<String, dynamic> toJson() => {
        "recipient_name": recipientName,
      };
}
