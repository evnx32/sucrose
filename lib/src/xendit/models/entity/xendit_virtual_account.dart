import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_va_channel_properties.dart';

class XenditVirtualAccount {
  /// Expected and accepted amount of the transaction in the actual value in the provided currency.
  ///
  /// Decimal places support varies per currency:
  ///
  /// IDR - Only supports positive integers.
  ///
  /// VND - Only supports positive integers.
  final int? amount;

  /// ISO 4217 three-letter code of the transaction's currency. Will be auto-filled based on the channel_code if not provided.
  final XenditCurrency currency;

  /// Identifier for the payment channel partner
  final XenditVAccountCode channelCode;

  /// Information provided specific to the channel partner that was provided during the request
  final XenditVAChannelProperties channelProperties;

  /// Object that contains the required information to perform payments with virtual account
  XenditVirtualAccount({
    this.amount,
    required this.currency,
    required this.channelCode,
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
        "currency": currency.name,
        "channel_code": channelCode.name,
        "channel_properties": channelProperties.toJson(),
      };
}
