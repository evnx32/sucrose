import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_retail_outlet_channel_properties.dart';

class XenditRetailOutlet {
  /// number Expected and accepted amount of the transaction in the actual value in the provided currency.
  ///
  /// If amount is not provided, the corresponding payment code will accept any amount as payment (open amount).
  ///
  /// so if you want to use OPEN amount, dont use this
  final double? amount;

  /// ISO 4217 three-letter code of the transaction's currency. Will be auto-filled based on the channel_code if not provided.
  final XenditOTCCurrency currency;

  /// Identifier for the payment channel partner
  final XenditOTCCode channelCode;

  /// Information provided specific to the channel partner that was provided during the request
  final XenditRetailOutletChannelProperties? channelProperties;

  /// Object that contains the required information to perform payments with retail outlet
  XenditRetailOutlet({
    this.amount,
    required this.currency,
    required this.channelCode,
    this.channelProperties,
  });

  factory XenditRetailOutlet.fromJson(Map<String, dynamic> json) =>
      XenditRetailOutlet(
        amount: json["amount"],
        currency: XenditOTCCurrency.values.firstWhere(
          (element) => element.name == json["currency"],
        ),
        channelCode: XenditOTCCode.values.firstWhere(
          (element) => element.name == json["channel_code"],
        ),
        channelProperties: json["channel_properties"] == null
            ? null
            : XenditRetailOutletChannelProperties.fromJson(
                json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency.name,
        "channel_code": channelCode.name,
        if (amount != null) "amount": amount,
        if (channelProperties != null)
          "channel_properties": channelProperties!.toJson(),
      };
}
