class MidtransRefundResponse {
  final String? statusCode;
  final String? statusMessage;
  final String? transactionId;
  final String? orderId;
  final String? merchantId;
  final String? grossAmount;
  final String? currency;
  final String? paymentType;
  final DateTime? transactionTime;
  final String? transactionStatus;
  final String? fraudStatus;
  final int? refundChargebackId;
  final String? refundChargebackUuid;
  final String? refundAmount;
  final DateTime? settlementTime;
  final String? refundKey;

  MidtransRefundResponse({
    this.statusCode,
    this.statusMessage,
    this.transactionId,
    this.orderId,
    this.merchantId,
    this.grossAmount,
    this.currency,
    this.paymentType,
    this.transactionTime,
    this.transactionStatus,
    this.fraudStatus,
    this.refundChargebackId,
    this.refundChargebackUuid,
    this.refundAmount,
    this.settlementTime,
    this.refundKey,
  });

  factory MidtransRefundResponse.fromJson(Map<String, dynamic> json) =>
      MidtransRefundResponse(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        transactionId: json["transaction_id"],
        orderId: json["order_id"],
        merchantId: json["merchant_id"],
        grossAmount: json["gross_amount"],
        currency: json["currency"],
        paymentType: json["payment_type"],
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
        transactionStatus: json["transaction_status"],
        fraudStatus: json["fraud_status"],
        refundChargebackId: json["refund_chargeback_id"],
        refundChargebackUuid: json["refund_chargeback_uuid"],
        refundAmount: json["refund_amount"],
        settlementTime: json["settlement_time"] == null
            ? null
            : DateTime.parse(json["settlement_time"]),
        refundKey: json["refund_key"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message": statusMessage,
        "transaction_id": transactionId,
        "order_id": orderId,
        "merchant_id": merchantId,
        "gross_amount": grossAmount,
        "currency": currency,
        "payment_type": paymentType,
        "transaction_time": transactionTime?.toIso8601String(),
        "transaction_status": transactionStatus,
        "fraud_status": fraudStatus,
        "refund_chargeback_id": refundChargebackId,
        "refund_chargeback_uuid": refundChargebackUuid,
        "refund_amount": refundAmount,
        "settlement_time": settlementTime?.toIso8601String(),
        "refund_key": refundKey,
      };
}
