import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_qr_channel_properties.dart';

class XenditQrCode {
  /// Expected and accepted amount of the transaction in the actual value in the provided currency.
  ///
  /// Decimal places support varies per currency:
  ///
  /// IDR - Only supports positive integers.
  ///
  /// VND - Only supports positive integers.
  ///
  /// THB - Supports up to two decimal places.
  final double? amount;

  /// ISO 4217 three-letter code of the transaction's currency. Will be auto-filled based on the channel_code if not provided.
  final XenditQRCurrency currency;

  /// Identifier for the QR Code standard used. This parameter is not required for Indonesia channel code.
  final XenditQRChannelCode channelCode;

  /// Information regarding the payment method / instrument
  final XenditQRChannelProperties? channelProperties;

  /// Object that contains the required information to perform payments with QR code
  XenditQrCode({
    this.amount,
    required this.currency,
    required this.channelCode,
    this.channelProperties,
  });

  factory XenditQrCode.fromJson(Map<String, dynamic> json) => XenditQrCode(
        amount: json["amount"],
        currency: XenditQRCurrency.values.firstWhere(
          (element) => element.name == json["currency"],
        ),
        channelCode: XenditQRChannelCode.values.firstWhere(
          (element) => element.name == json["channel_code"],
        ),
        channelProperties: json["channel_properties"] == null
            ? null
            : XenditQRChannelProperties.fromJson(json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        if (amount != null) "amount": amount,
        "currency": currency.name,
        "channel_code": channelCode.name,
        if (channelProperties != null)
          "channel_properties": channelProperties!.toJson(),
      };
}
