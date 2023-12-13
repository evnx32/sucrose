class MidtransCreditCardResponse {
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
  final DateTime? expiryTime;
  final String? bank;
  final String? redirectUrl;
  final String? maskedCard;
  final String? cardType;
  final String? channel;
  final String? threeDsVersion;
  final bool? onUs;

  MidtransCreditCardResponse({
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
    this.expiryTime,
    this.bank,
    this.redirectUrl,
    this.maskedCard,
    this.cardType,
    this.channel,
    this.threeDsVersion,
    this.onUs,
  });

  factory MidtransCreditCardResponse.fromJson(Map<String, dynamic> json) =>
      MidtransCreditCardResponse(
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
        expiryTime: json["expiry_time"] == null
            ? null
            : DateTime.parse(json["expiry_time"]),
        bank: json["bank"],
        redirectUrl: json["redirect_url"],
        maskedCard: json["masked_card"],
        cardType: json["card_type"],
        channel: json["channel"],
        threeDsVersion: json["three_ds_version"],
        onUs: json["on_us"],
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
        "expiry_time": expiryTime?.toIso8601String(),
        "bank": bank,
        "redirect_url": redirectUrl,
        "masked_card": maskedCard,
        "card_type": cardType,
        "channel": channel,
        "three_ds_version": threeDsVersion,
        "on_us": onUs,
      };
}
