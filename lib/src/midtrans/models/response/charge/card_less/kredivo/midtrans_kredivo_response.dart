class MidtransKredivoResponse {
  final String? statusCode;
  final String? statusMessage;
  final String? transactionId;
  final String? orderId;
  final String? redirectUrl;
  final String? merchantId;
  final String? grossAmount;
  final String? currency;
  final String? paymentType;
  final DateTime? transactionTime;
  final String? transactionStatus;
  final String? fraudStatus;
  final String? channelResponseCode;
  final String? channelResponseMessage;

  MidtransKredivoResponse({
    this.statusCode,
    this.statusMessage,
    this.transactionId,
    this.orderId,
    this.redirectUrl,
    this.merchantId,
    this.grossAmount,
    this.currency,
    this.paymentType,
    this.transactionTime,
    this.transactionStatus,
    this.fraudStatus,
    this.channelResponseCode,
    this.channelResponseMessage,
  });

  factory MidtransKredivoResponse.fromJson(Map<String, dynamic> json) =>
      MidtransKredivoResponse(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        transactionId: json["transaction_id"],
        orderId: json["order_id"],
        redirectUrl: json["redirect_url"],
        merchantId: json["merchant_id"],
        grossAmount: json["gross_amount"],
        currency: json["currency"],
        paymentType: json["payment_type"],
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
        transactionStatus: json["transaction_status"],
        fraudStatus: json["fraud_status"],
        channelResponseCode: json["channel_response_code"],
        channelResponseMessage: json["channel_response_message"],
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message": statusMessage,
        "transaction_id": transactionId,
        "order_id": orderId,
        "redirect_url": redirectUrl,
        "merchant_id": merchantId,
        "gross_amount": grossAmount,
        "currency": currency,
        "payment_type": paymentType,
        "transaction_time": transactionTime?.toIso8601String(),
        "transaction_status": transactionStatus,
        "fraud_status": fraudStatus,
        "channel_response_code": channelResponseCode,
        "channel_response_message": channelResponseMessage,
      };
}
