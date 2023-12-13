import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_qr_basket.dart';

class XenditEwalletPayment {
  /// Reference ID provided by merchant (255 characters)
  final String referenceId;

  /// Currency used for the transaction in ISO4217 format - `IDR`, `PHP`, `VND`, `THB`
  final String currency;

  /// Transaction amount to be paid
  /// Min - 1,000 for `ID_JENIUSPAY` and 100 IDR for all other eWallets or 1 PHP
  /// Max - based on eWallet holding limit
  final double amount;

  /// Checkout method determines the payment flow used to process the transaction
  ///
  /// `ONE_TIME_PAYMENT` is used for single guest checkouts
  ///
  /// `TOKENIZED_PAYMENT` can be used for recurring payment
  final String checkoutMethod;

  /// Channel Code specifies which eWallet will be used to process the transaction
  ///
  /// required if checkout_method = `ONE_TIME_PAYMENT`, optional if checkout_method = `TOKENIZED_PAYMENT`
  final XenditEwalletPaymentChannelCode? channelCode;

  /// Channel specific information required for the transaction to be initiated
  ///
  /// required based on `checkout_method` and `channel_code` pairing
  final XenditChannelProperties channelProperties;

  /// ID of the [payment method](https://developers.xendit.co/api-reference/#tokenized-create-payment-method). Payment method is being used for tokenized payment to abstract your customer's ewallet as payment method
  final String? paymentMethodId;

  /// ID of the [customer object](https://developers.xendit.co/api-reference/#customers) to which the payment method will be linked to. Use [Create Customer API](https://developers.xendit.co/api-reference/#tokenized-create-customer-object) to create your customer
  final String? customerId;

  /// Array of objects describing the item(s) purchased
  final List<XenditBasket>? basket;

  /// Object of additional information the user may use. Users define the JSON properties and values.
  ///
  /// You can specify up to 50 keys, with key names up to 40 characters long and values up to 500 characters long.
  ///
  /// This will only be used by the user and not Xendit.
  final XenditMetadata? metadata;

  /// Object for creating a new Ewallet Payment Request
  ///
  /// `payment_method_id` and `customer_id` are required if `checkout_method` is `TOKENIZED_PAYMENT`
  XenditEwalletPayment({
    required this.referenceId,
    required this.currency,
    required this.amount,
    required this.checkoutMethod,
    this.channelCode,
    required this.channelProperties,
    this.paymentMethodId,
    this.customerId,
    this.basket,
    this.metadata,
  });

  factory XenditEwalletPayment.fromJson(Map<String, dynamic> json) =>
      XenditEwalletPayment(
        referenceId: json["reference_id"],
        currency: json["currency"],
        amount: json["amount"],
        checkoutMethod: json["checkout_method"],
        channelCode: XenditEwalletPaymentChannelCode.values
            .firstWhere((element) => element.name == json["channel_code"]),
        channelProperties: json["channel_properties"] == null
            ? XenditChannelProperties()
            : XenditChannelProperties.fromJson(json["channel_properties"]),
        paymentMethodId: json["payment_method_id"],
        customerId: json["customer_id"],
        basket: json["basket"] == null
            ? []
            : List<XenditBasket>.from(
                json["basket"]!.map((x) => XenditBasket.fromJson(x))),
        metadata: json["metadata"] == null
            ? null
            : XenditMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "currency": currency,
        "amount": amount,
        "checkout_method": checkoutMethod,
        "channel_properties": channelProperties.toJson(),
        if (channelCode != null) "channel_code": channelCode?.name,
        if (paymentMethodId != null) "payment_method_id": paymentMethodId,
        if (customerId != null) "customer_id": customerId,
        if (basket != null)
          "basket": List<dynamic>.from(basket!.map((x) => x.toJson())),
        if (metadata != null) "metadata": metadata?.toJson(),
      };
}
