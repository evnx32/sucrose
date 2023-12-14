class MidtransQrisProps {
  /// The acquirer for QRIS. Possible values are `airpay shopee`, `gopay`. Default value: gopay.
  final String? acquirer;

  /// Charge details using QRIS.
  MidtransQrisProps({
    this.acquirer,
  });

  factory MidtransQrisProps.fromJson(Map<String, dynamic> json) =>
      MidtransQrisProps(
        acquirer: json["acquirer"],
      );

  Map<String, dynamic> toJson() => {
        "acquirer": acquirer,
      };
}
