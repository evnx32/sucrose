class XenditItem {
  final String? name;
  final int? quantity;
  final int? price;
  final String? category;
  final String? url;

  XenditItem({
    this.name,
    this.quantity,
    this.price,
    this.category,
    this.url,
  });

  factory XenditItem.fromJson(Map<String, dynamic> json) => XenditItem(
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
        "category": category,
        "url": url,
      };
}
