class XenditPaymentRefundResponse {
  final String? id;
  final String? chargeId;
  final String? status;
  final String? currency;
  final String? channelCode;
  final int? captureAmount;
  final int? refundAmount;
  final dynamic failureCode;
  final String? reason;
  final dynamic refundAmountToPayer;
  final dynamic payerCapturedAmount;
  final dynamic payerCapturedCurrency;
  final DateTime? created;
  final DateTime? updated;

  XenditPaymentRefundResponse({
    this.id,
    this.chargeId,
    this.status,
    this.currency,
    this.channelCode,
    this.captureAmount,
    this.refundAmount,
    this.failureCode,
    this.reason,
    this.refundAmountToPayer,
    this.payerCapturedAmount,
    this.payerCapturedCurrency,
    this.created,
    this.updated,
  });

  factory XenditPaymentRefundResponse.fromJson(Map<String, dynamic> json) =>
      XenditPaymentRefundResponse(
        id: json["id"],
        chargeId: json["charge_id"],
        status: json["status"],
        currency: json["currency"],
        channelCode: json["channel_code"],
        captureAmount: json["capture_amount"],
        refundAmount: json["refund_amount"],
        failureCode: json["failure_code"],
        reason: json["reason"],
        refundAmountToPayer: json["refund_amount_to_payer"],
        payerCapturedAmount: json["payer_captured_amount"],
        payerCapturedCurrency: json["payer_captured_currency"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "charge_id": chargeId,
        "status": status,
        "currency": currency,
        "channel_code": channelCode,
        "capture_amount": captureAmount,
        "refund_amount": refundAmount,
        "failure_code": failureCode,
        "reason": reason,
        "refund_amount_to_payer": refundAmountToPayer,
        "payer_captured_amount": payerCapturedAmount,
        "payer_captured_currency": payerCapturedCurrency,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
      };
}
