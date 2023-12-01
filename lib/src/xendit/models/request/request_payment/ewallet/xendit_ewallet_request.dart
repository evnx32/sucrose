import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method/xendit_ewallet_payment_method.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditEwalletRequest {
  /// The amount to be paid. if you want OPEN amount, dont use this
  final int? amount;
  final String? referenceId;
  final XenditEWalletCurrency currency;
  final XenditEwalletPaymentMethod paymentMethod;
  final String description;
  final XenditMetadata metadata;

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
