import 'package:sucrose/src/midtrans/models/entity/midtrans_customer_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_item_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_transaction_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/otc_props/midtrans_otc_props.dart';

class MidtransOTCRequest {
  /// The details of the specific transaction such as `order_id` and `gross_amount`.
  final MidtransTransactionDetail transactionDetails;

  /// The details of over-the-counter payment used for the transaction.
  final MidtransOTCProps cstore;

  /// Details of the item(s) purchased by the customer.
  final List<MidtransItemDetail>? itemDetails;

  /// Details of the customer.
  final MidtransCustomerDetails? customerDetails;

  MidtransOTCRequest({
    required this.transactionDetails,
    required this.cstore,
    this.itemDetails,
    this.customerDetails,
  });

  Map<String, dynamic> toJson() => {
        "payment_type": "cstore",
        "transaction_details": transactionDetails.toJson(),
        "cstore": cstore.toJson(),
        "item_details": itemDetails == null
            ? []
            : List<dynamic>.from(itemDetails!.map((x) => x.toJson())),
        "customer_details": customerDetails?.toJson(),
      };
}
