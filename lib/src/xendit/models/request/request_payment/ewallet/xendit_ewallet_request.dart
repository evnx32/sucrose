import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method/xendit_ewallet_payment_method.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditEwalletRequest {
  /// Expected and accepted amount of the transaction in the actual value in the provided currency.
  ///
  /// The amount to be paid. if you want OPEN amount, dont use this
  final double? amount;

  ///	Merchant-provided identifier for this payment request.
  ///
  /// If none is provided, Xendit will randomly generate a unique `reference_id`.
  final String? referenceId;

  /// ISO 4217 three-letter code of the transaction's currency. Will be auto-filled based on the channel_code if not provided.
  final XenditEWalletCurrency currency;

  /// Note: Only one of payment_method{} or payment_method_id must be present.
  ///
  /// Respective [Payment Method](https://developers.xendit.co/api-reference/payments-api/#create-payment-method) properties that corresponds to the chosen payment method type or channel.
  ///
  /// The request will apply the top-most values for `customer_id`, `currency`, and `amount`.
  final XenditEwalletPaymentMethod paymentMethod;

  /// Free-text field for any additional information regarding the payment method.
  ///
  /// Maximum length: 255 characters
  final String description;

  /// A free-format JSON for additional information that you may use.
  ///
  /// Object can be up to 50 keys, with key names up to 40 characters long and values up to 500 characters long.
  final XenditMetadata metadata;

  /// Object that contains the required information to perform payments with ewallet
  XenditEwalletRequest({
    this.amount,
    this.referenceId,
    required this.currency,
    required this.paymentMethod,
    required this.description,
    required this.metadata,
  });

  Map<String, dynamic> toJson() => {
        if (amount != null) "amount": amount,
        if (referenceId != null) "reference_id": referenceId,
        "currency": currency.name,
        "payment_method": paymentMethod.toJson(),
        "description": description,
        "metadata": metadata.toJson(),
      };
}
