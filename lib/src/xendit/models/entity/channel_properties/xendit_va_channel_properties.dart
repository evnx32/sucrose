class XenditVAChannelProperties {
  /// Complete name of the payor. May be used by the channel partner to verify their identity. Must contain letters and space only.
  final String? customerName;

  ///You may assign a specific Virtual Account number using this parameter. If you do not send one, one will be picked at random.
  ///
  ///Make sure the number you specify is within your Virtual Account range.
  final String? virtualAccountNumber;

  /// The date and time in ISO 8601 UTC+0 when the virtual account number will be expired.
  ///
  /// Default: The default expiration date will be 31 years from creation date.
  final DateTime? expiresAt;

  /// The suggested amount you want to be displayed on the partner channel's platform
  ///
  /// Note: Suggested amount is the amount that can seen as a suggestion, but user can still put any number (only supported for MANDIRI and BRI )
  final int? suggestedAmount;

  /// Object that contains the information to generate a valid payment code
  XenditVAChannelProperties({
    this.customerName,
    this.virtualAccountNumber,
    this.expiresAt,
    this.suggestedAmount,
  });

  factory XenditVAChannelProperties.fromJson(Map<String, dynamic> json) =>
      XenditVAChannelProperties(
        customerName: json["customer_name"],
        virtualAccountNumber: json["virtual_account_number"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
        suggestedAmount: json["suggested_amount"],
      );

  Map<String, dynamic> toJson() => {
        if (customerName != null) "customer_name": customerName,
        if (virtualAccountNumber != null)
          "virtual_account_number": virtualAccountNumber,
        if (expiresAt != null) "expires_at": expiresAt?.toIso8601String(),
        if (suggestedAmount != null) "suggested_amount": suggestedAmount,
      };
}
