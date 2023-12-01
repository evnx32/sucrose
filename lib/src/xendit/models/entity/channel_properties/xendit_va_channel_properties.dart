class XenditVAChannelProperties {
  final String? customerName;
  final String? virtualAccountNumber;
  final DateTime? expiresAt;

  XenditVAChannelProperties({
    this.customerName,
    this.virtualAccountNumber,
    this.expiresAt,
  });

  factory XenditVAChannelProperties.fromJson(Map<String, dynamic> json) =>
      XenditVAChannelProperties(
        customerName: json["customer_name"],
        virtualAccountNumber: json["virtual_account_number"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "customer_name": customerName,
        "virtual_account_number": virtualAccountNumber,
        "expires_at": expiresAt?.toIso8601String(),
      };
}
