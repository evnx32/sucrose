class RetailOutletChannelProperties {
  /// The payment code that you want to assign, e.g 12345. If none is provided, one will be generated at random.
  final String? paymentCode;

  /// Complete name of the payor. May be used by the channel partner to verify their identity. Must contain letters and space only.
  final String? customerName;

  /// The date and time in ISO 8601 UTC+0 when the payment code will be expired.
  ///
  /// Default: The default validity period will be 31 years for Indonesian channels and 2 days for Philippine channels from creation date.
  ///
  ///Note: The minimum is 2 hours and the maximum is 9 days for 7ELEVEN
  final DateTime? expiresAt;

  /// Object that contains the information to generate a valid payment code
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
        if (paymentCode != null) "payment_code": paymentCode,
        if (customerName != null) "customer_name": customerName,
        if (expiresAt != null) "expires_at": expiresAt?.toIso8601String(),
      };
}
