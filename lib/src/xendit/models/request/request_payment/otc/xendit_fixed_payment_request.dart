import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method/xendit_fixed_otc_payment_method.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_customer.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditFixedOTCPaymentRequest {
  /// Expected and accepted amount of the transaction in the actual value in the provided currency.
  ///
  /// Decimal places support varies per currency:
  final double amount;

  /// ISO 4217 three-letter code of the transaction's currency. Will be auto-filled based on the channel_code if not provided.
  final XenditQRCurrency currency;

  /// Merchant-provided identifier for this payment request.
  ///
  ///If none is provided, Xendit will randomly generate a unique `reference_id`.
  final String? referenceId;

  /// Note: Only one of payment_method{} or payment_method_id must be present.
  ///
  /// Respective Payment Method properties that corresponds to the chosen payment method type or channel.
  ///
  /// The request will apply the top-most values for customer_id, currency, and amount.
  final XenditFixedOTCPaymentMethod paymentMethod;

  /// Free-text field for any additional information regarding the payment method.
  ///
  /// Maximum length: 255 characters
  final String? description;

  /// A customer object to skip `Create Customer` URL endpoint process. This object is only available if `customer_id` is null.
  final XenditCustomer? customer;

  /// ID of the customer object to which the account token will be linked to. Call [Create Customer](https://developers.xendit.co/api-reference/payments-api/#create-customer) to generate Customer ID.
  final String? customerId;

  /// A free-format JSON for additional information that you may use.
  final XenditMetadata? metadata;

  /// 2-letter ISO 3166-2 country code indicating country of transaction. This is also be used as indicator for channels that are present in multiple markets (e.g. SHOPEEPAY).
  final String? country;

  /// Object that contains the required information to perform payments with QR
  XenditFixedOTCPaymentRequest({
    required this.amount,
    required this.currency,
    required this.paymentMethod,
    required this.description,
    this.referenceId,
    this.customer,
    this.customerId,
    this.metadata,
    this.country,
  });

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency.name,
        "payment_method": paymentMethod.toJson(),
        if (referenceId != null) "reference_id": referenceId,
        if (description != null) "description": description,
        if (customer != null) "customer": customer!.toJson(),
        if (customerId != null) "customer_id": customerId,
        if (metadata != null) "metadata": metadata!.toJson(),
        if (country != null) "country": country,
      };
}
