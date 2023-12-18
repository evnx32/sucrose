class MidtransCustomExpiry {
  /// Timestamp at which the order is created on your website, in ISO 8601 format. Time Zone: GMT+7.
  ///
  /// Note: If not defined, expiry time starts from transaction time.
  final DateTime? orderTime;

  /// Time duration for which the payment remains valid.
  final int? expiryDuration;

  /// Unit for expiry_duration.
  ///
  /// Possible values are `second`, `minute`, `hour`, or `day`.
  ///
  /// Note: Default value is minute.
  final String? unit;

  MidtransCustomExpiry({
    this.orderTime,
    this.expiryDuration,
    this.unit,
  });

  factory MidtransCustomExpiry.fromJson(Map<String, dynamic> json) =>
      MidtransCustomExpiry(
        orderTime: json["order_time"] == null
            ? null
            : DateTime.parse(json["order_time"]),
        expiryDuration: json["expiry_duration"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "order_time": orderTime?.toIso8601String(),
        "expiry_duration": expiryDuration,
        "unit": unit,
      };
}
