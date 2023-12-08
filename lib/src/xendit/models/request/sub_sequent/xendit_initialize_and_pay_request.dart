import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_payment_method.dart';

class XenditInitializeAndPayRequest {
  /// ISO 4217 three-letter code of the transaction's currency. Will be auto-filled based on the channel_code if not provided.
  /// Accepted values: `IDR`,`PHP`,`THB`,`MYR`
  final String currency;

  /// Expected and accepted amount of the transaction in the actual value in the provided currency.
  ///
  /// Decimal places support varies per currency:
  ///
  /// `IDR` - Only supports positive integers.
  ///
  /// `PHP` - Supports up to two decimal places.
  ///
  /// `THB` - Supports up to two decimal places.
  ///
  /// `MYR` - Supports up to two decimal places.
  final double amount;

  /// Merchant-provided identifier for this payment request.
  ///
  /// If none is provided, Xendit will randomly generate a unique reference_id.
  ///
  /// Maximum length: 255 characters
  final String? referenceId;

  /// 2-letter ISO 3166-2 country code indicating country of transaction. This is also be used as indicator for channels that are present in multiple markets (e.g. SHOPEEPAY).
  ///
  /// Accepted values:
  ///
  /// `ID` - Indonesia
  ///
  /// `PH` - Philippines
  ///
  /// `TH` - Thailand
  ///
  /// `MY` - Malaysia
  final String? country;

  /// Free-text field for any additional information regarding the payment method.
  ///
  /// Maximum length: 255 characters
  final String? description;

  /// ID of the customer object to which the account token will be linked to. Call [Create Customer](https://developers.xendit.co/api-reference/payments-api/#create-customer) to generate Customer ID.
  final String customerId;

  /// Object that contains the required information to perform payments with SubSequent
  final XenditPaymentMethod paymentMethod;

  /// Specific settings to be applied to the transaction. This also overwrites any common parameters with the Payment Method Object.
  final XenditChannelProperties? channelProperties;

  /// A free-format JSON for additional information that you may use.
  ///
  /// Object can be up to 50 keys, with key names up to 40 characters long and values up to 500 characters long.
  final XenditMetadata? metadata;

  // Object that contains the required information to perform payments with SubSequent
  XenditInitializeAndPayRequest({
    required this.currency,
    required this.amount,
    this.referenceId,
    this.country,
    this.description,
    required this.customerId,
    required this.paymentMethod,
    this.channelProperties,
    this.metadata,
  });

  factory XenditInitializeAndPayRequest.fromJson(Map<String, dynamic> json) =>
      XenditInitializeAndPayRequest(
        currency: json["currency"],
        amount: json["amount"]?.toDouble(),
        referenceId: json["reference_id"],
        country: json["country"],
        description: json["description"],
        customerId: json["customer_id"],
        paymentMethod: XenditPaymentMethod.fromJson(json["payment_method"]),
        channelProperties: json["channel_properties"],
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "amount": amount,
        "payment_method": paymentMethod.toJson(),
        "customer_id": customerId,
        if (referenceId != null) "reference_id": referenceId,
        if (country != null) "country": country,
        if (description != null) "description": description,
        if (channelProperties != null)
          "channel_properties": channelProperties!.toJson(),
        if (metadata != null) "metadata": metadata!.toJson(),
      };
}
