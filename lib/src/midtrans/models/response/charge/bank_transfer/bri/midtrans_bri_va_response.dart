import 'package:sucrose/src/midtrans/models/entity/midtrans_va_number.dart';

class MidtransBriVAResponse {
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
  final List<MidtransVaNumber>? vaNumbers;
  final DateTime? expiryTime;

  MidtransBriVAResponse({
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
    this.vaNumbers,
    this.expiryTime,
  });

  factory MidtransBriVAResponse.fromJson(Map<String, dynamic> json) =>
      MidtransBriVAResponse(
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
        vaNumbers: json["va_numbers"] == null
            ? []
            : List<MidtransVaNumber>.from(
                json["va_numbers"]!.map((x) => MidtransVaNumber.fromJson(x))),
        expiryTime: json["expiry_time"] == null
            ? null
            : DateTime.parse(json["expiry_time"]),
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
        "va_numbers": vaNumbers == null
            ? []
            : List<dynamic>.from(vaNumbers!.map((x) => x.toJson())),
        "expiry_time": expiryTime?.toIso8601String(),
      };
}
