class XenditQRChannelProperties {
  final String? qrString;
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
        "qr_string": qrString,
        "expires_at": expiresAt?.toIso8601String(),
      };
}
