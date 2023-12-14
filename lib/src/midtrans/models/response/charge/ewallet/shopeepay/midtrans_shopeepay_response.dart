import 'package:sucrose/src/midtrans/models/entity/midtrans_action.dart';

class MidtransShopeePayResponse {
  final String? statusCode;
  final String? statusMessage;
  final String? channelResponseCode;
  final String? channelResponseMessage;
  final String? transactionId;
  final String? orderId;
  final String? merchantId;
  final String? grossAmount;
  final String? currency;
  final String? paymentType;
  final DateTime? transactionTime;
  final String? transactionStatus;
  final String? fraudStatus;
  final List<MidtransAction>? actions;
  final DateTime? expiryTime;

  MidtransShopeePayResponse({
    this.statusCode,
    this.statusMessage,
    this.channelResponseCode,
    this.channelResponseMessage,
    this.transactionId,
    this.orderId,
    this.merchantId,
    this.grossAmount,
    this.currency,
    this.paymentType,
    this.transactionTime,
    this.transactionStatus,
    this.fraudStatus,
    this.actions,
    this.expiryTime,
  });

  factory MidtransShopeePayResponse.fromJson(Map<String, dynamic> json) =>
      MidtransShopeePayResponse(
        statusCode: json["status_code"],
        statusMessage: json["status_message"],
        channelResponseCode: json["channel_response_code"],
        channelResponseMessage: json["channel_response_message"],
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
        actions: json["actions"] == null
            ? []
            : List<MidtransAction>.from(
                json["actions"]!.map((x) => MidtransAction.fromJson(x))),
        expiryTime: json["expiry_time"] == null
            ? null
            : DateTime.parse(json["expiry_time"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "status_message": statusMessage,
        "channel_response_code": channelResponseCode,
        "channel_response_message": channelResponseMessage,
        "transaction_id": transactionId,
        "order_id": orderId,
        "merchant_id": merchantId,
        "gross_amount": grossAmount,
        "currency": currency,
        "payment_type": paymentType,
        "transaction_time": transactionTime?.toIso8601String(),
        "transaction_status": transactionStatus,
        "fraud_status": fraudStatus,
        "actions": actions == null
            ? []
            : List<dynamic>.from(actions!.map((x) => x.toJson())),
        "expiry_time": expiryTime?.toIso8601String(),
      };
}
