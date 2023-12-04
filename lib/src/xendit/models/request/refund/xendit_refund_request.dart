// To parse this JSON data, do
//
//     final xenditRefundRequest = xenditRefundRequestFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/sucrose.dart';

XenditRefundRequest xenditRefundRequestFromJson(String str) =>
    XenditRefundRequest.fromJson(json.decode(str));

String xenditRefundRequestToJson(XenditRefundRequest data) =>
    json.encode(data.toJson());

class XenditRefundRequest {
  final String? paymentRequestId;
  final String? referenceId;
  final String? invoiceId;
  final XenditRefundCurrency currency;
  final int? amount;
  final XenditRefundReason reason;
  final XenditMetadata? metadata;

  XenditRefundRequest({
    this.paymentRequestId,
    this.referenceId,
    this.invoiceId,
    required this.currency,
    this.amount,
    required this.reason,
    this.metadata,
  });

  factory XenditRefundRequest.fromJson(Map<String, dynamic> json) =>
      XenditRefundRequest(
        paymentRequestId: json["payment_request_id"],
        referenceId: json["reference_id"],
        invoiceId: json["invoice_id"],
        currency: json["currency"],
        amount: json["amount"],
        reason: json["reason"],
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        if (paymentRequestId != null) "payment_request_id": paymentRequestId,
        if (referenceId != null) "reference_id": referenceId,
        if (invoiceId != null) "invoice_id": invoiceId,
        if (amount != null) "amount": amount,
        "currency": currency.name,
        "reason": reason.name,
        if (metadata != null) "metadata": metadata!.toJson(),
      };
}
