import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_ewallet_channel_properties.dart';

class XenditEwalletProps {
  /// The channel code of the QR code.
  final XenditEWalletCode channelCode;

  /// The expiration date of the QR code.
  final DateTime? expirationDate;
  final XenditEwalletChannelProperties channelProperties;

  XenditEwalletProps({
    required this.channelCode,
    this.expirationDate,
    required this.channelProperties,
  });

  factory XenditEwalletProps.fromJson(Map<String, dynamic> json) =>
      XenditEwalletProps(
        channelCode: json["channel_code"],
        channelProperties: XenditEwalletChannelProperties.fromJson(
          json["channel_properties"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "channel_code": channelCode.name,
        if (expirationDate != null)
          "expiration_date": expirationDate!.toIso8601String(),
        "channel_properties": channelProperties.toJson(),
      };
}
