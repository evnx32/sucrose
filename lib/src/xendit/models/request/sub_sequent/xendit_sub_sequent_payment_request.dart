import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditSubSequentPaymentRequest {
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

  /// ID of the customer object to which the account token will be linked to. Call [Create Customer](https://developers.xendit.co/api-reference/payments-api/#create-customer) to generate Customer ID.
  final String customerId;

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

  /// Object that contains the required information to perform payments with SubSequent
  final String paymentMethodId;

  /// Specific settings to be applied to the transaction. This also overwrites any common parameters with the Payment Method Object.
  final XenditChannelProperties? channelProperties;

  /// A free-format JSON for additional information that you may use.
  ///
  /// Object can be up to 50 keys, with key names up to 40 characters long and values up to 500 characters long.
  final XenditMetadata? metadata;

  // Object that contains the required information to perform payments with SubSequent
  XenditSubSequentPaymentRequest({
    required this.currency,
    required this.amount,
    this.referenceId,
    required this.customerId,
    this.country,
    this.description,
    required this.paymentMethodId,
    this.channelProperties,
    this.metadata,
  });

  factory XenditSubSequentPaymentRequest.fromJson(Map<String, dynamic> json) =>
      XenditSubSequentPaymentRequest(
        currency: json["currency"],
        amount: json["amount"]?.toDouble(),
        referenceId: json["reference_id"],
        customerId: json["customer_id"],
        country: json["country"],
        description: json["description"],
        paymentMethodId: json["payment_method_id"],
        channelProperties: json["channel_properties"],
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "amount": amount,
        "payment_method_id": paymentMethodId,
        "customer_id": customerId,
        if (referenceId != null) "reference_id": referenceId,
        if (country != null) "country": country,
        if (description != null) "description": description,
        if (channelProperties != null)
          "channel_properties": channelProperties!.toJson(),
        if (metadata != null) "metadata": metadata!.toJson(),
      };
}
