import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_qr_basket.dart';

class XenditQrCodesResponse {
  final String? referenceId;
  final String? type;
  final String? currency;
  final String? channelCode;
  final double? amount;
  final DateTime? expiresAt;
  final List<XenditBasket>? basket;
  final XenditMetadata? metadata;
  final String? businessId;
  final String? id;
  final DateTime? created;
  final DateTime? updated;
  final String? qrString;
  final String? status;

  XenditQrCodesResponse({
    this.referenceId,
    this.type,
    this.currency,
    this.channelCode,
    this.amount,
    this.expiresAt,
    this.basket,
    this.metadata,
    this.businessId,
    this.id,
    this.created,
    this.updated,
    this.qrString,
    this.status,
  });

  factory XenditQrCodesResponse.fromJson(Map<String, dynamic> json) =>
      XenditQrCodesResponse(
        referenceId: json["reference_id"],
        type: json["type"],
        currency: json["currency"],
        channelCode: json["channel_code"],
        amount: double.tryParse(json["amount"].toString()),
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
        basket: json["basket"] == null
            ? []
            : List<XenditBasket>.from(
                json["basket"]!.map((x) => XenditBasket.fromJson(x))),
        metadata: json["metadata"] == null
            ? null
            : XenditMetadata.fromJson(json["metadata"]),
        businessId: json["business_id"],
        id: json["id"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        qrString: json["qr_string"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "type": type,
        "currency": currency,
        "channel_code": channelCode,
        "amount": amount,
        "expires_at": expiresAt?.toIso8601String(),
        "basket": basket == null
            ? []
            : List<dynamic>.from(basket!.map((x) => x.toJson())),
        "metadata": metadata?.toJson(),
        "business_id": businessId,
        "id": id,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "qr_string": qrString,
        "status": status,
      };
}
