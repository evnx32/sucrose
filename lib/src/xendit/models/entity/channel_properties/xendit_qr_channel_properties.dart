class XenditQRChannelProperties {
  /// QR string to be rendered for display to end users.
  final String? qrString;

  /// The expiration date of the QR code.
  final DateTime? expiresAt;

  XenditQRChannelProperties({
    this.qrString,
    this.expiresAt,
  });

  factory XenditQRChannelProperties.fromJson(Map<String, dynamic> json) =>
      XenditQRChannelProperties(
        qrString: json["qr_string"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        if (qrString != null) "qr_string": qrString,
        if (expiresAt != null) "expires_at": expiresAt?.toIso8601String(),
      };
}
