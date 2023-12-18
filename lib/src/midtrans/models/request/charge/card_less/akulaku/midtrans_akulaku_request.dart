import 'package:sucrose/src/midtrans/models/entity/midtrans_customer_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_item_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_transaction_detail.dart';

class MidtransAkulakuRequest {
  /// The details of the specific transaction such as `order_id` and `gross_amount`.
  final MidtransTransactionDetail transactionDetails;

  /// Details of the item purchased by the customer. All field in the given sample are Required.
  ///
  /// Note: By default, this field is mandatory. Merchant requires Kredivo approval to make this optional.
  final MidtransItemDetail itemDetails;

  /// Details of the customer. All field in the given sample are Required.
  ///
  /// Note: By default, this field is mandatory. Merchant requires Kredivo approval to make this optional.
  final MidtransCustomerDetails customerDetails;

  MidtransAkulakuRequest({
    required this.transactionDetails,
    required this.itemDetails,
    required this.customerDetails,
  });

  factory MidtransAkulakuRequest.fromJson(Map<String, dynamic> json) =>
      MidtransAkulakuRequest(
        transactionDetails:
            MidtransTransactionDetail.fromJson(json["transaction_details"]),
        itemDetails: MidtransItemDetail.fromJson(json["item_details"]),
        customerDetails:
            MidtransCustomerDetails.fromJson(json["customer_details"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_type": "akulaku",
        "transaction_details": transactionDetails.toJson(),
        "item_details": itemDetails.toJson(),
        "customer_details": customerDetails.toJson(),
      };
}
