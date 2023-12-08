import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_invoice_customer.dart';
import 'package:sucrose/src/xendit/models/request/request_payment/xendit_payment_method_request.dart';

import '../../entity/xendit_metadata.dart';

class XenditRequestPayment {
  final double amount;
  final XenditCurrency currency;
  final XenditPaymentMethodRequest paymentMethod;
  final String? description;
  final XenditMetadata? metadata;
  final String? customerId;
  final XenditInvoiceCustomer? customer;

  XenditRequestPayment({
    required this.amount,
    required this.currency,
    required this.paymentMethod,
    this.description,
    this.metadata,
    this.customerId,
    this.customer,
  });

  factory XenditRequestPayment.fromJson(Map<String, dynamic> json) =>
      XenditRequestPayment(
        amount: json["amount"],
        currency: json["currency"],
        paymentMethod: json["payment_method"],
        description: json["description"],
        customerId: json["customer_id"],
        customer: json["customer"] == null
            ? null
            : XenditInvoiceCustomer.fromJson(json["customer"]),
        metadata: json["metadata"] == null
            ? null
            : XenditMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency.name,
        "payment_method": paymentMethod.toJson(),
        "description": description,
        "metadata": metadata?.toJson(),
      };
}
