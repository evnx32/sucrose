import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method/xendit_qr_payment_method.dart';

class XenditQrRequest {
  final int amount;
  final XenditQRCurrency currency;
  final XenditQRPaymentMethod paymentMethod;
  final String description;
  final XenditMetadata metadata;

  XenditQrRequest({
    required this.amount,
    required this.currency,
    required this.paymentMethod,
    required this.description,
    required this.metadata,
  });

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency.name,
        "payment_method": paymentMethod.toJson(),
        "description": description,
        "metadata": metadata.toJson(),
      };
}
