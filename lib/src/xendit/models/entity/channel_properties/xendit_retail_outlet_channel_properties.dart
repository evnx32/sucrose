class RetailOutletChannelProperties {
  final String? paymentCode;
  final String? customerName;
  final DateTime? expiresAt;

  RetailOutletChannelProperties({
    this.paymentCode,
    this.customerName,
    this.expiresAt,
  });

  factory RetailOutletChannelProperties.fromJson(Map<String, dynamic> json) =>
      RetailOutletChannelProperties(
        paymentCode: json["payment_code"],
        customerName: json["customer_name"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_code": paymentCode,
        "customer_name": customerName,
        "expires_at": expiresAt?.toIso8601String(),
      };
}
