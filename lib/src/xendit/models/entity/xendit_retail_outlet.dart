import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_retail_outlet_channel_properties.dart';

class XenditRetailOutlet {
  final int? amount;
  final int? currency;
  final XenditOTCCode? channelCode;
  final RetailOutletChannelProperties? channelProperties;

  XenditRetailOutlet({
    this.amount,
    this.currency,
    this.channelCode,
    this.channelProperties,
  });

  factory XenditRetailOutlet.fromJson(Map<String, dynamic> json) =>
      XenditRetailOutlet(
        amount: json["amount"],
        currency: json["currency"],
        channelCode: json["channel_code"] == null
            ? null
            : XenditOTCCode.values.firstWhere(
                (element) => element.name == json["channel_code"],
              ),
        channelProperties: json["channel_properties"] == null
            ? null
            : RetailOutletChannelProperties.fromJson(
                json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        if (amount != null) "amount": amount,
        if (currency != null) "currency": currency,
        if (channelCode != null) "channel_code": channelCode!.name,
        if (channelProperties != null)
          "channel_properties": channelProperties!.toJson(),
      };
}
