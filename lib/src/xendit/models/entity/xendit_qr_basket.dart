import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';

class XenditBasket {
  /// Merchant's identifier for specific product (255 characters)
  final String referenceId;

  /// Name of product (255 characters)
  final String name;

  /// Merchant category for item - e.g. `Electronics` (255 characters)
  final String category;

  /// Currency used for the transaction in ISO4217 format
  ///
  /// Available values: IDR
  final String currency;

  /// Price per unit in basket currency
  final int price;

  /// Number of units of this item in the basket
  final int quantity;

  /// Type of product - `PRODUCT` or `SERVICE`
  final String type;

  /// URL to the e-commerce page of the item
  final String url;

  /// Description of product (255 characters)
  final String description;
  // final String subCategory;

  /// Object of additional information the merchant may use. Merchant defines the JSON properties and values
  ///
  /// Merchant can specify up to 50 keys, with key names up to 40 characters long and values up to 500 characters long
  final XenditMetadata? metadata;

  XenditBasket({
    required this.referenceId,
    required this.name,
    required this.category,
    required this.currency,
    required this.price,
    required this.quantity,
    required this.type,
    required this.url,
    required this.description,
    this.metadata,
  });

  factory XenditBasket.fromJson(Map<String, dynamic> json) => XenditBasket(
        referenceId: json["reference_id"],
        name: json["name"],
        category: json["category"],
        currency: json["currency"],
        price: json["price"],
        quantity: json["quantity"],
        type: json["type"],
        url: json["url"],
        description: json["description"],
        metadata: json["metadata"] == null
            ? null
            : XenditMetadata.fromJson(json["metadata"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "name": name,
        "category": category,
        "currency": currency,
        "price": price,
        "quantity": quantity,
        "type": type,
        "url": url,
        "description": description,
        if (metadata != null) "metadata": metadata?.toJson(),
      };
}
