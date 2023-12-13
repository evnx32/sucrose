class MidtransItemDetail {
  final String? id;
  final int? price;
  final int? quantity;
  final String? name;
  final String? brand;
  final String? category;
  final String? merchantName;

  MidtransItemDetail({
    this.id,
    this.price,
    this.quantity,
    this.name,
    this.brand,
    this.category,
    this.merchantName,
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

class TransactionDetails {
  final String? orderId;
  final int? grossAmount;

  TransactionDetails({
    this.orderId,
    this.grossAmount,
  });

  factory TransactionDetails.fromJson(Map<String, dynamic> json) =>
      TransactionDetails(
        orderId: json["order_id"],
        grossAmount: json["gross_amount"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "gross_amount": grossAmount,
      };
}
