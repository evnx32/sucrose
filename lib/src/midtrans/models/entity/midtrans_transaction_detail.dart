class MidtransTransactionDetail {
  final String orderId;
  final int grossAmount;

  MidtransTransactionDetail({
    required this.orderId,
    required this.grossAmount,
  });

  factory MidtransTransactionDetail.fromJson(Map<String, dynamic> json) =>
      MidtransTransactionDetail(
        orderId: json["order_id"],
        grossAmount: json["gross_amount"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "gross_amount": grossAmount,
      };
}
