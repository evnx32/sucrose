class XenditInvoiceItem {
  /// Name of the product
  ///
  /// Maximum length 256 characters
  final String name;

  /// Number of units of this item in the basket
  ///
  /// Maximum value 100000
  final int quantity;

  /// Price per unit in basket currency
  final int price;

  /// Merchant category for item
  ///
  /// Example: Fashion, Electronic
  final String? category;

  /// The public URL of the specific item detail page. Must be HTTP or HTTPS
  ///
  /// Example: https://yourcompany.com/example_item
  final String? url;

  /// Array of items JSON objects describing the item(s) purchased. Max array size: 75. Mandatory for PayLater payment method.
  XenditInvoiceItem({
    required this.name,
    required this.quantity,
    required this.price,
    this.category,
    this.url,
  });

  factory XenditInvoiceItem.fromJson(Map<String, dynamic> json) =>
      XenditInvoiceItem(
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        category: json["category"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
        "price": price,
        if (category != null) "category": category,
        if (url != null) "url": url,
      };
}
