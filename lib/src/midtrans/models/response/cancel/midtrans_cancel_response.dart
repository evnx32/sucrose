class MidtransCancelResponse {
  /// Status code of transaction cancel result.
  final String? statusCode;

  ///	Description of transaction cancel result.
  final String? statusMessage;

  /// Transaction ID given by Midtrans.
  final String? transactionId;

  /// Order ID specified by you.
  final String? orderId;

  /// Merchant ID specified by you.
  final String? merchantId;

  /// Total amount of transaction in IDR.
  final String? grossAmount;

  /// Currency used in transaction.
  final String? currency;

  /// Payment method used in transaction.
  final String? paymentType;

  /// Transaction status.
  final String? transactionStatus;

  /// Detection result by Fraud Detection System (FDS). Possible values are
  /// `accept` : Approved by FDS.
  /// `deny`: Denied by FDS. Transaction automatically failed.
  final String? fraudStatus;

  /// Timestamp of transaction in ISO 8601 format. Time Zone: GMT+7.
  final DateTime? transactionTime;

  /// Payment code of transaction.
  final String? paymentCode;

  /// Store name where transaction is made.
  final String? store;

  MidtransCancelResponse({
    this.statusCode,
    this.statusMessage,
    this.transactionId,
    this.orderId,
    this.merchantId,
    this.grossAmount,
    this.currency,
    this.paymentType,
    this.transactionStatus,
    this.fraudStatus,
    this.transactionTime,
    this.paymentCode,
    this.store,
  });

  factory MidtransCancelResponse.fromJson(Map<String, dynamic> json) =>
      MidtransCancelResponse(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        transactionId: json["transaction_id"],
        orderId: json["order_id"],
        merchantId: json["merchant_id"],
        grossAmount: json["gross_amount"],
        currency: json["currency"],
        paymentType: json["payment_type"],
        transactionStatus: json["transaction_status"],
        fraudStatus: json["fraud_status"],
        transactionTime: json["transaction_time"] == null
            ? null
            : DateTime.parse(json["transaction_time"]),
        paymentCode: json["payment_code"],
        store: json["store"],
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
        "transaction_status": transactionStatus,
        "fraud_status": fraudStatus,
        "transaction_time": transactionTime?.toIso8601String(),
        "payment_code": paymentCode,
        "store": store,
      };
}
