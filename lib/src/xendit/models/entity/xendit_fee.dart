class XenditFee {
  /// Specify any string value that describes the fee you are charging your customer, e.g: admin, shipping, tax, discount. We recommend you keep your fee types consistent and simple.
  final String? type;

  /// Amount of this specific fee. Can be positive or negative.
  final int? value;

  /// Array of items JSON objects describing the fee(s) that you charge to your end customer. This can be an admin fee, logistics fee, etc. This amount will be included in the total invoice amount and will be transferred to your balance when the transaction settles. Max array size: 10.
  XenditFee({
    this.type,
    this.value,
  });

  factory XenditFee.fromJson(Map<String, dynamic> json) => XenditFee(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}
