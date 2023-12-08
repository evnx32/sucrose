import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_actions.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_item.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_payment_method.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_shipping_information.dart';

class XenditListPaymentRequestResponse {
  final List<XenditListPaymentRequestData>? data;
  final bool? hasMore;

  XenditListPaymentRequestResponse({
    this.data,
    this.hasMore,
  });

  factory XenditListPaymentRequestResponse.fromJson(
          Map<String, dynamic> json) =>
      XenditListPaymentRequestResponse(
        data: json["data"] == null
            ? []
            : List<XenditListPaymentRequestData>.from(json["data"]!
                .map((x) => XenditListPaymentRequestData.fromJson(x))),
        hasMore: json["has_more"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "has_more": hasMore,
      };
}

class XenditListPaymentRequestData {
  final String? id;
  final String? country;
  final int? amount;
  final String? currency;
  final String? businessId;
  final String? referenceId;
  final XenditPaymentMethod? paymentMethod;
  final String? description;
  final XenditMetadata? metadata;
  final String? customerId;
  final String? captureMethod;
  final String? initiator;
  final dynamic cardVerificationResults;
  final DateTime? created;
  final DateTime? updated;
  final String? status;
  final List<XenditActions>? actions;
  final String? failureCode;
  final XenditChannelProperties? channelProperties;
  final XenditShippingInformation? shippingInformation;
  final List<XenditItem>? items;

  XenditListPaymentRequestData({
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

  factory XenditListPaymentRequestData.fromJson(Map<String, dynamic> json) =>
      XenditListPaymentRequestData(
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
            : XenditMetadata.fromJson(json["metadata"]),
        customerId: json["customer_id"],
        captureMethod: json["capture_method"]!,
        initiator: json["initiator"],
        cardVerificationResults: json["card_verification_results"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        status: json["status"],
        actions: json["actions"] == null
            ? []
            : List<XenditActions>.from(json["actions"].map((x) => x)),
        failureCode: json["failure_code"],
        channelProperties: json["channel_properties"],
        shippingInformation: json["shipping_information"],
        items: json["items"] == null
            ? []
            : List<XenditItem>.from(
                json["items"].map((x) => XenditItem.fromJson(x))),
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
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
