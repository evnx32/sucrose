import 'package:sucrose/src/xendit/models/xendit_models.dart';

class XenditRefundResponse {
  final String? id;
  final String? paymentId;
  final dynamic invoiceId;
  final int? amount;
  final String? paymentMethodType;
  final String? channelCode;
  final String? currency;
  final String? status;
  final String? reason;
  final String? referenceId;
  final String? failureCode;
  final int? refundFeeAmount;
  final DateTime? created;
  final DateTime? updated;
  final XenditMetadata? metadata;

  XenditRefundResponse({
    this.id,
    this.paymentId,
    this.invoiceId,
    this.amount,
    this.paymentMethodType,
    this.channelCode,
    this.currency,
    this.status,
    this.reason,
    this.referenceId,
    this.failureCode,
    this.refundFeeAmount,
    this.created,
    this.updated,
    this.metadata,
  });

  factory XenditRefundResponse.fromJson(Map<String, dynamic> json) =>
      XenditRefundResponse(
        id: json["id"],
        paymentId: json["payment_id"],
        invoiceId: json["invoice_id"],
        amount: json["amount"],
        paymentMethodType: json["payment_method_type"],
        channelCode: json["channel_code"],
        currency: json["currency"],
        status: json["status"],
        reason: json["reason"],
        referenceId: json["reference_id"],
        failureCode: json["failure_code"],
        refundFeeAmount: json["refund_fee_amount"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_id": paymentId,
        "invoice_id": invoiceId,
        "amount": amount,
        "payment_method_type": paymentMethodType,
        "channel_code": channelCode,
        "currency": currency,
        "status": status,
        "reason": reason,
        "reference_id": referenceId,
        "failure_code": failureCode,
        "refund_fee_amount": refundFeeAmount,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "metadata": metadata,
      };
}
