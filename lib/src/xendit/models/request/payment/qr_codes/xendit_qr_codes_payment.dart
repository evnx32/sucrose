import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_qr_basket.dart';

class XenditQrCodesPayment {
  /// Reference ID provided by merchant. Does not need to be unique (255 characters)
  final String referenceId;

  /// `DYNAMIC` or `STATIC`
  ///
  /// Note: Dynamic QR code contains the amount value to be paid upon scanning and can only be paid a single time
  ///
  /// Static QR code requires end user to input the payment value and can be paid multiple times
  final String type;

  /// Currency used for the transaction in ISO4217 format
  ///
  /// Available values: `IDR`
  final String currency;

  /// Amount specified in request
  ///
  /// Static QR codes require the end user to always input the amount to be paid at the point of scanning
  ///
  /// Note: Min amount is 1 IDR
  ///
  /// Max amount is 10,000,000 IDR
  final double? amount;

  /// Amount specified in request
  ///
  /// Static QR codes require the end user to always input the amount to be paid at the point of scanning
  ///
  /// Note: Min amount is 1 IDR
  ///
  /// Max amount is 10,000,000 IDR
  final String? channelCode;

  /// ISO 8601 Timestamp for QR code expiry. Timezone UTC+0
  ///
  /// Format: YYYY-MM-DDTHH:mm:ssZ
  ///
  /// Note: For `ID_DANA`'s dynamic QR code, default is QR code expires in 48 hours from creation time if `expires_at` is not specified. For `ID_DANA`'s static QR code, the QR code never expires, so `expires_at` value will always be `null`
  final DateTime? expiresAt;

  /// Array of objects describing the item(s) purchased
  final List<XenditBasket>? basket;

  /// Object of additional information the merchant may use. Merchant defines the JSON properties and values
  ///
  /// Merchant can specify up to 50 keys, with key names up to 40 characters long and values up to 500 characters long
  final XenditMetadata? metadata;

  XenditQrCodesPayment({
    required this.referenceId,
    required this.type,
    required this.currency,
    this.amount,
    this.channelCode,
    this.expiresAt,
    this.basket,
    this.metadata,
  });

  factory XenditQrCodesPayment.fromJson(Map<String, dynamic> json) =>
      XenditQrCodesPayment(
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
