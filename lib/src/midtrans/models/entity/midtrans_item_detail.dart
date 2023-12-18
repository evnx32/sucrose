class MidtransItemDetail {
  /// The ID of the item.
  final String? id;

  /// Price of the item in IDR.
  ///
  /// **Note:** Do not add decimal.
  final int price;

  /// The quantity of the item.
  final int quantity;

  /// The name of the item.
  final String name;

  /// The brand of the item.
  final String? brand;

  /// The category of the item.
  final String? category;

  /// The merchant name of the item.
  final String? merchantName;

  /// Installment term, use two digits numeric. For example, 03, 06, 09, 12, 24.
  ///
  /// **Note:** This is a *BCA KlikPay* exclusive field.
  final String? tenor;

  /// Installment code, use **000** for default.
  ///
  /// **Note:** This is a *BCA KlikPay* exclusive field.
  final String? codePlan;

  /// Installment Merchant ID.
  ///
  /// **Note:** This is a *BCA KlikPay* exclusive field.
  final String? mid;

  /// HTTP URL of the item in the merchant site
  final String? url;

  MidtransItemDetail({
    this.id,
    required this.price,
    required this.quantity,
    required this.name,
    this.brand,
    this.category,
    this.merchantName,
    this.tenor,
    this.codePlan,
    this.mid,
    this.url,
  });

  factory MidtransItemDetail.fromJson(Map<String, dynamic> json) =>
      MidtransItemDetail(
        id: json["id"],
        price: json["price"],
        quantity: json["quantity"],
        name: json["name"],
        brand: json["brand"],
        category: json["category"],
        merchantName: json["merchant_name"],
        tenor: json["tenor"],
        codePlan: json["code_plan"],
        mid: json["mid"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "quantity": quantity,
        "name": name,
        "brand": brand,
        "category": category,
        "merchant_name": merchantName,
      };
}
