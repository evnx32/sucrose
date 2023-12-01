import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_va_channel_properties.dart';

class XenditVirtualAccountProps {
  /// The channel code of the QR code.
  final XenditVAccountCode channelCode;

  /// The expiration date of the QR code.
  final DateTime? expirationDate;
  final XenditVAChannelProperties channelProperties;

  XenditVirtualAccountProps({
    required this.channelCode,
    this.expirationDate,
    required this.channelProperties,
  });

  factory XenditVirtualAccountProps.fromJson(Map<String, dynamic> json) =>
      XenditVirtualAccountProps(
        channelCode: json["channel_code"],
        channelProperties: json["channel_properties"] == null
            ? XenditVAChannelProperties()
            : XenditVAChannelProperties.fromJson(
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
