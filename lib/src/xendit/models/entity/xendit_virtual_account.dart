import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_va_channel_properties.dart';

class XenditVirtualAccount {
  final int? amount;
  final XenditCurrency? currency;
  final XenditVAccountCode? channelCode;
  final XenditVAChannelProperties channelProperties;

  XenditVirtualAccount({
    this.amount,
    this.currency,
    this.channelCode,
    required this.channelProperties,
  });

  factory XenditVirtualAccount.fromJson(Map<String, dynamic> json) =>
      XenditVirtualAccount(
        amount: json["amount"],
        currency: XenditCurrency.values
            .firstWhere((element) => element.name == json["currency"]),
        channelCode: XenditVAccountCode.values
            .firstWhere((element) => element.name == json["channel_code"]),
        channelProperties: json["channel_properties"] == null
            ? XenditVAChannelProperties()
            : XenditVAChannelProperties.fromJson(
                json["channel_properties"],
              ),
      );

  Map<String, dynamic> toJson() => {
        if (amount != null) "amount": amount,
        if (currency != null) "currency": currency?.name,
        if (channelCode != null) "channel_code": channelCode?.name,
        "channel_properties": channelProperties.toJson(),
      };
}
