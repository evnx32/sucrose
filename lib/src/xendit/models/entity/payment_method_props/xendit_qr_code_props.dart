import '../../../enums/enums.dart';

class XenditQrCodeProps {
  /// Identifier for the QR Code standard used.
  final XenditQRChannelCode channelCode;

  /// Timestamp in ISO 8601 UTC+0 for when the QR Code will be valid.
  final DateTime? expirationDate;

  /// Object that contains the required information to perform payments with QR code
  XenditQrCodeProps({
    required this.channelCode,
    this.expirationDate,
  });

  factory XenditQrCodeProps.fromJson(Map<String, dynamic> json) =>
      XenditQrCodeProps(
        channelCode: json["channel_code"],
      );

  Map<String, dynamic> toJson() => {
        "channel_code": channelCode.name,
        if (expirationDate != null)
          "expiration_date": expirationDate!.toIso8601String(),
      };
}
