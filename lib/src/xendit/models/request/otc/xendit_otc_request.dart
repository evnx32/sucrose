import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditOtcRequest {
  /// An ID of your choice. Often it is unique identifier like a phone number, email or transaction ID.
  ///
  /// `Characters` Special and alphanumeric
  ///
  /// `Minimum length` 1 character
  ///
  /// `Maximum length` 1000 characters
  final String referenceId;

  /// Channel code of selected payment method.
  ///
  /// Available Channel Codes: `7ELEVEN`,  `7ELEVEN_CLIQQ`,  `CEBUANA`,  `ECPAY`,  `LBC`
  ///
  /// Integration via DragonPay: `DP_PALAWAN`, `DP_MLHUILLIER`, `DP_ECPAY_LOAN`, `DP_RD_PAWNSHOP`, `DP_CVM`, `DP_ECPAY_SCHOOL`, `DP_USSC`
  ///
  /// Note: You can use `DP_ECPAY_LOAN` and `DP_ECPAY_SCHOOL` to enable Gcash & Paymaya Bill Payment
  final String channelCode;

  /// The amount that is expected to be paid by end customer
  ///
  /// the minimum is PHP 50 and the maximum is PHP 10,000 for `7ELEVEN`
  ///
  /// the minimum is PHP 100 and the maximum is PHP 50,000 for `7ELEVEN_CLIQQ`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 30,000 for `CEBUANA`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 50,000 for `ECPAY`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 200,000 for `LBC`
  ///
  /// Integration via DragonPay
  ///
  /// the minimum is PHP 1 and the maximum is PHP 20,000 for `DP_PALAWAN`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 200,000 for `DP_MLHUILLIER`
  ///
  /// the minimum is PHP 15 and the maximum is PHP 50,000 for `DP_ECPAY_LOAN`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 20,000 for `DP_RD_PAWNSHOP`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 30,000 for `DP_CVM`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 50,000 for `DP_ECPAY_SCHOOL`
  ///
  /// the minimum is PHP 1 and the maximum is PHP 20,000 for `DP_USSC`

  /// Note:
  ///
  /// amount is required if you want to create closed type payment code
  ///
  /// For open type payment code, `amount` field can be `empty` or `null`
  final double? amount;

  /// ISO 4217 Currency code
  ///
  /// Supported currency code: `PHP`
  final String currency;

  /// Name of user - this might be used by the Retail Outlets cashier to validate the end user
  ///
  /// `Characters` alphanumeric
  ///
  /// `Special Characters: # / . " - , ' _ @ ( ) & ] [ :`
  ///
  /// `Minimum length` 1 character
  ///
  /// `Maximum length` 250 characters
  final String customerName;

  /// 2-letter ISO 3166-2 country code indicating country of transaction.
  ///
  /// Supported market: `PH`
  final String market;

  /// You can assign specific fixed payment code using this parameter e.g `12345`. If you do not send one, one will be picked at random
  ///
  /// Make sure when you want to create payment code, you do not include the prefix on this field. For example: your prefix is `PSTEST` and you want to create payment code `PSTEST12345`, you can only fill `12345` on this field
  ///
  /// You can check your prefix information on [Retail Outlet details](https://dashboard.xendit.co/settings/payment-methods#retail-outlets)
  ///
  /// default: `random string`
  final String? paymentCode;

  /// The time when the payment code will be expired.
  ///
  /// the minimum is 2 hours and the maximum is 9 days for `7ELEVEN`
  ///
  /// timezone: `UTC+0`
  ///
  /// default: `The expired date will be 2 days from payment code generated`
  final DateTime? expiresAt;

  /// When set to `false`, the payment code will be a multiple use payment code and active after it is paid.
  ///
  /// Channel code that supports multiple use: `7ELEVEN_CLIQQ`, `CEBUANA`, `ECPAY`, `LBC`, `DP_ECPAY_LOAN`, `DP_RD_PAWNSHOP`, `DP_CVM`, `DP_ECPAY_SCHOOL`, `DP_USSC`
  ///
  /// default: `true`
  final String? isSingleUse;

  /// Description of the payment code.
  ///
  /// `Minimum length` 1 character
  ///
  /// `Maximum length` 250 characters
  final String? description;

  /// Object of additional key-value pairs that the merchants may use like internal system parameters (business ID, shopping cart). User defines the JSON properties and values.
  ///
  /// You can specify up to 50 keys, with key names up to 40 characters long and values up to 500 characters long.
  ///
  /// Otherwise NULL
  final XenditMetadata? metadata;

  XenditOtcRequest({
    required this.referenceId,
    required this.channelCode,
    this.amount,
    required this.currency,
    required this.customerName,
    required this.market,
    this.paymentCode,
    this.expiresAt,
    this.isSingleUse,
    this.description,
    this.metadata,
  });

  factory XenditOtcRequest.fromJson(Map<String, dynamic> json) =>
      XenditOtcRequest(
        referenceId: json["reference_id"],
        channelCode: json["channel_code"],
        amount: json["amount"],
        currency: json["currency"],
        customerName: json["customer_name"],
        market: json["market"],
        paymentCode: json["payment_code"],
        expiresAt: json["expires_at"],
        isSingleUse: json["is_single_use"],
        description: json["description"],
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "channel_code": channelCode,
        if (amount != null) "amount": amount,
        "currency": currency,
        "customer_name": customerName,
        "market": market,
        if (paymentCode != null) "payment_code": paymentCode,
        if (expiresAt != null)
          "expires_at": "${expiresAt!.toIso8601String().substring(0, 19)}Z",
        if (isSingleUse != null) "is_single_use": isSingleUse,
        if (description != null) "description": description,
        if (metadata != null) "metadata": metadata?.toJson(),
      };
}
