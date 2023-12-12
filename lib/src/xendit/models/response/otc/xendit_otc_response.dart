import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditOtcResponse {
  final String? id;
  final String? businessId;
  final String? referenceId;
  final String? customerName;
  final String? paymentCode;
  final String? currency;
  final int? amount;
  final String? channelCode;
  final String? description;
  final bool? isSingleUse;
  final String? market;
  final String? status;
  final XenditMetadata? metadata;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? expiresAt;

  XenditOtcResponse({
    this.id,
    this.businessId,
    this.referenceId,
    this.customerName,
    this.paymentCode,
    this.currency,
    this.amount,
    this.channelCode,
    this.description,
    this.isSingleUse,
    this.market,
    this.status,
    this.metadata,
    this.createdAt,
    this.updatedAt,
    this.expiresAt,
  });

  factory XenditOtcResponse.fromJson(Map<String, dynamic> json) =>
      XenditOtcResponse(
        id: json["id"],
        businessId: json["business_id"],
        referenceId: json["reference_id"],
        customerName: json["customer_name"],
        paymentCode: json["payment_code"],
        currency: json["currency"],
        amount: json["amount"],
        channelCode: json["channel_code"],
        description: json["description"],
        isSingleUse: json["is_single_use"],
        market: json["market"],
        status: json["status"],
        metadata: json["metadata"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "business_id": businessId,
        "reference_id": referenceId,
        "customer_name": customerName,
        "payment_code": paymentCode,
        "currency": currency,
        "amount": amount,
        "channel_code": channelCode,
        "description": description,
        "is_single_use": isSingleUse,
        "market": market,
        "status": status,
        "metadata": metadata?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "expires_at": expiresAt?.toIso8601String(),
      };
}
