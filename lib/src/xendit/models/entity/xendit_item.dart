// To parse this JSON data, do
//
//     final xenditItem = xenditItemFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

XenditItem xenditItemFromJson(String str) =>
    XenditItem.fromJson(json.decode(str));

String xenditItemToJson(XenditItem data) => json.encode(data.toJson());

class XenditItem {
  final String? type;
  final String? referenceId;
  final String? name;
  final int? netUnitAmount;
  final int? quantity;
  final String? url;
  final String? category;
  final String? subcategory;
  final String? description;
  final XenditMetadata? metadata;

  XenditItem({
    this.type,
    this.referenceId,
    this.name,
    this.netUnitAmount,
    this.quantity,
    this.url,
    this.category,
    this.subcategory,
    this.description,
    this.metadata,
  });

  factory XenditItem.fromJson(Map<String, dynamic> json) => XenditItem(
        type: json["type"],
        referenceId: json["reference_id"],
        name: json["name"],
        netUnitAmount: json["net_unit_amount"],
        quantity: json["quantity"],
        url: json["url"],
        category: json["category"],
        subcategory: json["subcategory"],
        description: json["description"],
        metadata: json["metadata"] == null
            ? null
            : XenditMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "reference_id": referenceId,
        "name": name,
        "net_unit_amount": netUnitAmount,
        "quantity": quantity,
        "url": url,
        "category": category,
        "subcategory": subcategory,
        "description": description,
        "metadata": metadata?.toJson(),
      };
}
