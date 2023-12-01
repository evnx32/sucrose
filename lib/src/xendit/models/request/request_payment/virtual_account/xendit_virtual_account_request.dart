import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method/xendit_va_payment_method.dart';

import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditVirtualAccountRequest {
  /// The amount to be paid. if you want OPEN amount, dont use this
  final int? amount;
  final XenditVACurrency currency;
  final XenditVAPaymentMethod paymentMethod;
  final String description;
  final XenditMetadata metadata;

  XenditVirtualAccountRequest({
    this.amount,
    required this.currency,
    required this.paymentMethod,
    required this.description,
    required this.metadata,
  });

  Map<String, dynamic> toJson() => {
        if (amount != null) "amount": amount,
        "currency": currency.name,
        "payment_method": paymentMethod.toJson(),
        "description": description,
        "metadata": metadata.toJson(),
      };
}
