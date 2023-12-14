class MidtransRefundRequest {
  /// Merchant refund ID. If not passed then Midtrans creates a new one. It is recommended to use this parameter to avoid double refund attempt. Allowed characters are alphabets, numbers, dash (-), and underscore (_).
  final String? refundKey;

  /// Amount to be refunded. By default whole transaction amount is refunded.
  final int? amount;

  /// Reason justifying the refund.
  ///
  /// For GoPay & GoPay Tokenization payments, reason will be shown on customers' GoPay transaction history.
  final String? reason;

  MidtransRefundRequest({
    this.refundKey,
    this.amount,
    this.reason,
  });

  factory MidtransRefundRequest.fromJson(Map<String, dynamic> json) =>
      MidtransRefundRequest(
        refundKey: json["refund_key"],
        amount: json["amount"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        "refund_key": refundKey,
        "amount": amount,
        "reason": reason,
      };
}
