// To parse this JSON data, do
//
//     final xenditRetailOutlet = xenditRetailOutletFromJson(jsonString);

import 'dart:convert';

XenditRetailOutlet xenditRetailOutletFromJson(String str) =>
    XenditRetailOutlet.fromJson(json.decode(str));

String xenditRetailOutletToJson(XenditRetailOutlet data) =>
    json.encode(data.toJson());

class XenditRetailOutlet {
  final int? amount;
  final String? currency;
  final String? channelCode;
  final ChannelProperties? channelProperties;

  XenditRetailOutlet({
    this.amount,
    this.currency,
    this.channelCode,
    this.channelProperties,
  });

  factory XenditRetailOutlet.fromJson(Map<String, dynamic> json) =>
      XenditRetailOutlet(
        amount: json["amount"],
        currency: json["currency"],
        channelCode: json["channel_code"],
        channelProperties: json["channel_properties"] == null
            ? null
            : ChannelProperties.fromJson(json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "currency": currency,
        "channel_code": channelCode,
        "channel_properties": channelProperties?.toJson(),
      };
}

class ChannelProperties {
  final String? paymentCode;
  final String? customerName;
  final DateTime? expiresAt;

  ChannelProperties({
    this.paymentCode,
    this.customerName,
    this.expiresAt,
  });

  factory ChannelProperties.fromJson(Map<String, dynamic> json) =>
      ChannelProperties(
        paymentCode: json["payment_code"],
        customerName: json["customer_name"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_code": paymentCode,
        "customer_name": customerName,
        "expires_at": expiresAt?.toIso8601String(),
      };
}
