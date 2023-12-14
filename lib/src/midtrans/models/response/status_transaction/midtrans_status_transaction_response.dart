class MidtransStatusTransactionResponse {
  final DateTime? transactionTime;
  final String? grossAmount;
  final String? currency;
  final String? orderId;
  final String? paymentType;
  final String? signatureKey;
  final String? statusCode;
  final String? transactionId;
  final String? transactionStatus;
  final String? fraudStatus;
  final DateTime? expiryTime;
  final DateTime? settlementTime;
  final String? statusMessage;
  final String? merchantId;
  final List<MidtransRefundTransaction>? refunds;
  final String? refundAmount;

  MidtransStatusTransactionResponse({
    this.transactionTime,
    this.grossAmount,
    this.currency,
    this.orderId,
    this.paymentType,
    this.signatureKey,
    this.statusCode,
    this.transactionId,
    this.transactionStatus,
    this.fraudStatus,
    this.expiryTime,
    this.settlementTime,
    this.statusMessage,
    this.merchantId,
    this.refunds,
    this.refundAmount,
  });

  factory MidtransStatusTransactionResponse.fromJson(
          Map<String, dynamic> json) =>
      MidtransStatusTransactionResponse(
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
        grossAmount: json["gross_amount"],
        currency: json["currency"],
        orderId: json["order_id"],
        paymentType: json["payment_type"],
        signatureKey: json["signature_key"],
        statusCode: json["status_code"],
        transactionId: json["transaction_id"],
        transactionStatus: json["transaction_status"],
        fraudStatus: json["fraud_status"],
        expiryTime: json["expiry_time"] == null
            ? null
            : DateTime.parse(json["expiry_time"]),
        settlementTime: json["settlement_time"] == null
            ? null
            : DateTime.parse(json["settlement_time"]),
        statusMessage: json["status_message"],
        merchantId: json["merchant_id"],
        refunds: json["refunds"] == null
            ? []
            : List<MidtransRefundTransaction>.from(json["refunds"]!
                .map((x) => MidtransRefundTransaction.fromJson(x))),
        refundAmount: json["refund_amount"],
      );

  Map<String, dynamic> toJson() => {
        "transaction_time": transactionTime?.toIso8601String(),
        "gross_amount": grossAmount,
        "currency": currency,
        "order_id": orderId,
        "payment_type": paymentType,
        "signature_key": signatureKey,
        "status_code": statusCode,
        "transaction_id": transactionId,
        "transaction_status": transactionStatus,
        "fraud_status": fraudStatus,
        "expiry_time": expiryTime?.toIso8601String(),
        "settlement_time": settlementTime?.toIso8601String(),
        "status_message": statusMessage,
        "merchant_id": merchantId,
        "refunds": refunds == null
            ? []
            : List<dynamic>.from(refunds!.map((x) => x.toJson())),
        "refund_amount": refundAmount,
      };
}

class MidtransRefundTransaction {
  final int? refundChargebackId;
  final String? refundChargebackUuid;
  final String? refundAmount;
  final DateTime? createdAt;
  final String? reason;
  final String? refundKey;
  final String? refundMethod;
  final DateTime? bankConfirmedAt;

  MidtransRefundTransaction({
    this.refundChargebackId,
    this.refundChargebackUuid,
    this.refundAmount,
    this.createdAt,
    this.reason,
    this.refundKey,
    this.refundMethod,
    this.bankConfirmedAt,
  });

  factory MidtransRefundTransaction.fromJson(Map<String, dynamic> json) =>
      MidtransRefundTransaction(
        refundChargebackId: json["refund_chargeback_id"],
        refundChargebackUuid: json["refund_chargeback_uuid"],
        refundAmount: json["refund_amount"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        reason: json["reason"],
        refundKey: json["refund_key"],
        refundMethod: json["refund_method"],
        bankConfirmedAt: json["bank_confirmed_at"] == null
            ? null
            : DateTime.parse(json["bank_confirmed_at"]),
      );

  Map<String, dynamic> toJson() => {
        "refund_chargeback_id": refundChargebackId,
        "refund_chargeback_uuid": refundChargebackUuid,
        "refund_amount": refundAmount,
        "created_at": createdAt?.toIso8601String(),
        "reason": reason,
        "refund_key": refundKey,
        "refund_method": refundMethod,
        "bank_confirmed_at": bankConfirmedAt?.toIso8601String(),
      };
}
