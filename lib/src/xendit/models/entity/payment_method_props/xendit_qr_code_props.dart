import '../../../enums/enums.dart';

class XenditQrCodeProps {
  /// The channel code of the QR code.
  final XenditQRChannelCode channelCode;

  /// The expiration date of the QR code.
  final DateTime? expirationDate;

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
