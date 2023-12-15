import 'package:sucrose/src/midtrans/models/entity/midtrans_metadata.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_subscription_account_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/subscription_props/midtrans_subscription_schedule_props.dart';

class MidtransGetSubscriptionGopayResponse {
  final String? id;
  final String? name;
  final String? amount;
  final String? currency;
  final DateTime? createdAt;
  final MidtransSubscriptionScheduleProps? schedule;
  final String? status;
  final String? token;
  final String? paymentType;
  final List<String>? transactionIds;
  final MidtransMetadata? metadata;
  final MidtransSubscriptionCustomerDetails? customerDetails;

  MidtransGetSubscriptionGopayResponse({
    this.id,
    this.name,
    this.amount,
    this.currency,
    this.createdAt,
    this.schedule,
    this.status,
    this.token,
    this.paymentType,
    this.transactionIds,
    this.metadata,
    this.customerDetails,
  });

  factory MidtransGetSubscriptionGopayResponse.fromJson(
          Map<String, dynamic> json) =>
      MidtransGetSubscriptionGopayResponse(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        currency: json["currency"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        schedule: json["schedule"] == null
            ? null
            : MidtransSubscriptionScheduleProps.fromJson(json["schedule"]),
        status: json["status"],
        token: json["token"],
        paymentType: json["payment_type"],
        transactionIds: json["transaction_ids"] == null
            ? []
            : List<String>.from(json["transaction_ids"]!.map((x) => x)),
        metadata: json["metadata"] == null
            ? null
            : MidtransMetadata.fromJson(json["metadata"]),
        customerDetails: json["customer_details"] == null
            ? null
            : MidtransSubscriptionCustomerDetails.fromJson(
                json["customer_details"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "currency": currency,
        "created_at": createdAt?.toIso8601String(),
        "schedule": schedule?.toJson(),
        "status": status,
        "token": token,
        "payment_type": paymentType,
        "transaction_ids": transactionIds == null
            ? []
            : List<dynamic>.from(transactionIds!.map((x) => x)),
        "metadata": metadata?.toJson(),
        "customer_details": customerDetails?.toJson(),
      };
}
