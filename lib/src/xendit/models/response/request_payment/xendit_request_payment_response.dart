// To parse this JSON data, do
//
//     final xenditQrResponse = xenditQrResponseFromJson(jsonString);

import 'dart:convert';

import '../../entity/xendit_payment_method.dart';

XenditRequestPaymentResponse xenditQrResponseFromJson(String str) =>
    XenditRequestPaymentResponse.fromJson(json.decode(str));

String xenditQrResponseToJson(XenditRequestPaymentResponse data) =>
    json.encode(data.toJson());

class XenditRequestPaymentResponse {
  final String? id;
  final String? country;
  final int? amount;
  final String? currency;
  final String? businessId;
  final String? referenceId;
  final XenditPaymentMethod? paymentMethod;
  final String? description;
  final Metadata? metadata;
  final String? customerId;
  final String? captureMethod;
  final dynamic initiator;
  final dynamic cardVerificationResults;
  final DateTime? created;
  final DateTime? updated;
  final String? status;
  final List<dynamic>? actions;
  final dynamic failureCode;
  final dynamic channelProperties;
  final dynamic shippingInformation;
  final dynamic items;

  XenditRequestPaymentResponse({
    this.id,
    this.country,
    this.amount,
    this.currency,
    this.businessId,
    this.referenceId,
    this.paymentMethod,
    this.description,
    this.metadata,
    this.customerId,
    this.captureMethod,
    this.initiator,
    this.cardVerificationResults,
    this.created,
    this.updated,
    this.status,
    this.actions,
    this.failureCode,
    this.channelProperties,
    this.shippingInformation,
    this.items,
  });

  factory XenditRequestPaymentResponse.fromJson(Map<String, dynamic> json) =>
      XenditRequestPaymentResponse(
        id: json["id"],
        country: json["country"],
        amount: json["amount"],
        currency: json["currency"],
        businessId: json["business_id"],
        referenceId: json["reference_id"],
        paymentMethod: json["payment_method"] == null
            ? null
            : XenditPaymentMethod.fromJson(json["payment_method"]),
        description: json["description"],
        metadata: json["metadata"] == null
            ? null
            : Metadata.fromJson(json["metadata"]),
        customerId: json["customer_id"],
        captureMethod: json["capture_method"],
        initiator: json["initiator"],
        cardVerificationResults: json["card_verification_results"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        status: json["status"],
        actions: json["actions"] == null
            ? []
            : List<dynamic>.from(json["actions"]!.map((x) => x)),
        failureCode: json["failure_code"],
        channelProperties: json["channel_properties"],
        shippingInformation: json["shipping_information"],
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "amount": amount,
        "currency": currency,
        "business_id": businessId,
        "reference_id": referenceId,
        "payment_method": paymentMethod?.toJson(),
        "description": description,
        "metadata": metadata?.toJson(),
        "customer_id": customerId,
        "capture_method": captureMethod,
        "initiator": initiator,
        "card_verification_results": cardVerificationResults,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "status": status,
        "actions":
            actions == null ? [] : List<dynamic>.from(actions!.map((x) => x)),
        "failure_code": failureCode,
        "channel_properties": channelProperties,
        "shipping_information": shippingInformation,
        "items": items,
      };
}

class Metadata {
  final String? foo;

  Metadata({
    this.foo,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        foo: json["foo"],
      );

  Map<String, dynamic> toJson() => {
        "foo": foo,
      };
}
