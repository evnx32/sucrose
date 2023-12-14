import 'package:sucrose/src/midtrans/models/entity/midtrans_credit_card.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_customer_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_item_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_transaction_detail.dart';

class MidtransCreditCardRequest {
  /// The details of the specific transaction such as `order_id` and `gross_amount`.
  final MidtransTransactionDetail transactionDetails;

  /// The details of the payment card used for the transaction.
  final MidtransCreditCard creditCard;

  /// Details of the item(s) purchased by the customer.
  final List<MidtransItemDetail>? itemDetails;

  /// Details of the customer.
  final MidtransCustomerDetails? customerDetails;

  MidtransCreditCardRequest({
    required this.transactionDetails,
    required this.creditCard,
    this.itemDetails,
    this.customerDetails,
  });

  factory MidtransCreditCardRequest.fromJson(Map<String, dynamic> json) =>
      MidtransCreditCardRequest(
        transactionDetails:
            MidtransTransactionDetail.fromJson(json["transaction_details"]),
        creditCard: MidtransCreditCard.fromJson(json["credit_card"]),
        itemDetails: json["item_details"] == null
            ? []
            : List<MidtransItemDetail>.from(json["item_details"]!
                .map((x) => MidtransItemDetail.fromJson(x))),
        customerDetails: json["customer_details"] == null
            ? null
            : MidtransCustomerDetails.fromJson(json["customer_details"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_type": "credit_card",
        "transaction_details": transactionDetails.toJson(),
        "credit_card": creditCard.toJson(),
        "item_details": itemDetails == null
            ? []
            : List<dynamic>.from(itemDetails!.map((x) => x.toJson())),
        "customer_details": customerDetails?.toJson(),
      };
}
