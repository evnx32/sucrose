import 'package:sucrose/src/xendit/models/entity/xendit_qr_channel_properties.dart';

class XenditQrCodeResponse {
  final int? amount;
  final String? currency;
  final String? channelCode;
  final XenditQRChannelProperties? channelProperties;

  XenditQrCodeResponse({
    this.amount,
    this.currency,
    this.channelCode,
    this.channelProperties,
  });

  factory XenditQrCodeResponse.fromJson(Map<String, dynamic> json) =>
      XenditQrCodeResponse(
        amount: json["amount"],
        currency: json["currency"],
        channelCode: json["channel_code"],
        channelProperties: json["channel_properties"] == null
            ? null
            : XenditQRChannelProperties.fromJson(json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency,
        "channel_code": channelCode,
        "channel_properties": channelProperties?.toJson(),
      };
}
