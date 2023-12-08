import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_qr_basket.dart';

class XenditQrCodesRequest {
  final String referenceId;
  final String type;
  final String currency;
  final double? amount;
  final String? channelCode;
  final DateTime? expiresAt;
  final List<XenditBasket>? basket;
  final XenditMetadata? metadata;

  XenditQrCodesRequest({
    required this.referenceId,
    required this.type,
    required this.currency,
    this.amount,
    this.channelCode,
    this.expiresAt,
    this.basket,
    this.metadata,
  });

  factory XenditQrCodesRequest.fromJson(Map<String, dynamic> json) =>
      XenditQrCodesRequest(
        referenceId: json["reference_id"],
        type: json["type"],
        currency: json["currency"],
        amount: json["amount"],
        channelCode: json["channel_code"],
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
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "type": type,
        "currency": currency,
        if (amount != null) "amount": amount,
        if (channelCode != null) "channel_code": channelCode,
        if (expiresAt != null)
          "expires_at": '${expiresAt!.toIso8601String().substring(0, 19)}Z',
        if (basket != null)
          "basket": List<dynamic>.from(basket!.map((x) => x.toJson())),
        if (metadata != null) "metadata": metadata?.toJson(),
      };
}
