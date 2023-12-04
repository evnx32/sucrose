// To parse this JSON data, do
//
//     final xenditEwalletLinking = xenditEwalletLinkingFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_customer.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_ewallet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

XenditEwalletLinkingRequest xenditEwalletLinkingFromJson(String str) =>
    XenditEwalletLinkingRequest.fromJson(json.decode(str));

String xenditEwalletLinkingToJson(XenditEwalletLinkingRequest data) =>
    json.encode(data.toJson());

class XenditEwalletLinkingRequest {
  final String? referenceId;
  final XenditIdentityAccountType type;
  final XenditReusablePaymentMethod reusability;
  final String country;

  /// ID of the customer object to which the account token will be linked to. Call Tokenized - Create Customer to generate Customer ID
  final String? customerId;

  /// A customer object to skip Create Customer URL endpoint process. This object is required for all if the customer_id is null.
  final XenditCustomer? customer;
  final XenditEwallet ewallet;
  final String? description;
  final XenditMetadata? metadata;

  XenditEwalletLinkingRequest({
    this.referenceId,
    required this.type,
    required this.reusability,
    required this.country,
    this.customerId,
    this.customer,
    required this.ewallet,
    this.description,
    this.metadata,
  });

  factory XenditEwalletLinkingRequest.fromJson(Map<String, dynamic> json) =>
      XenditEwalletLinkingRequest(
        referenceId: json["reference_id"],
        type: XenditIdentityAccountType.values.firstWhere(
          (element) => element.name == json["type"],
        ),
        reusability: XenditReusablePaymentMethod.values.firstWhere(
          (element) => element.name == json["reusability"],
        ),
        country: json["country"],
        customerId: json["customer_id"],
        customer: json["customer"],
        ewallet: XenditEwallet.fromJson(json["ewallet"]),
        description: json["description"],
        metadata: json["metadata"],
      );

  Map<String, dynamic> toJson() => {
        if (referenceId != null) "reference_id": referenceId,
        "type": type.name,
        "reusability": reusability.name,
        "country": country,
        if (customerId != null) "customer_id": customerId,
        if (customer != null) "customer": customer?.toJson(),
        "ewallet": ewallet.toJson(),
        if (description != null) "description": description,
        if (metadata != null) "metadata": metadata?.toJson(),
      };
}
