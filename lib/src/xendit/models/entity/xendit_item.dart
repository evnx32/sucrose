import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditItem {
  /// Type of item
  ///
  /// (Atome does not support DISCOUNT)
  final XenditPaymentRequestItemType type;

  /// Merchant’s identifier for specific item (ie. SKU, promotion code, etc)
  final String referenceId;

  /// Item name
  ///
  /// Format Special and alphanumeric
  ///
  /// Max length 255 characters
  final String name;

  /// Net amount to be charged per unit, please put negative amount for DISCOUNT (e.g. -1000000)
  final int netUnitAmount;

  /// Number of units of this item in the basket
  ///
  /// `Min` 1
  final int quantity;

  /// URL of the item
  ///
  /// Must be HTTPS or HTTP
  final String url;

  /// Merchant category for item
  ///
  /// Format Special and alphanumeric
  ///
  /// Max length 255 characters
  final String category;

  /// Merchant subcategory for item
  ///
  /// Format Special and alphanumeric
  ///
  /// Max length 255 characters
  final String? subcategory;

  /// Item description
  ///
  /// Format Special and alphanumeric
  ///
  /// Max length 255 characters
  final String? description;

  /// Additional object that may be used for additional item attributes
  final XenditMetadata? metadata;

  XenditItem({
    required this.type,
    required this.referenceId,
    required this.name,
    required this.netUnitAmount,
    required this.quantity,
    required this.url,
    required this.category,
    this.subcategory,
    this.description,
    this.metadata,
  });

  factory XenditItem.fromJson(Map<String, dynamic> json) => XenditItem(
        type: XenditPaymentRequestItemType.values
            .firstWhere((element) => element.name == json["type"]),
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
        "type": type.name,
        "reference_id": referenceId,
        "name": name,
        "net_unit_amount": netUnitAmount,
        "quantity": quantity,
        "url": url,
        "category": category,
        if (subcategory != null) "subcategory": subcategory,
        if (description != null) "description": description,
        if (metadata != null) "metadata": metadata?.toJson(),
      };
}
