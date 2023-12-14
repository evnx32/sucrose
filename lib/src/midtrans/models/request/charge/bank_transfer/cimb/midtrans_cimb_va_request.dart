import 'package:sucrose/src/midtrans/models/entity/midtrans_customer_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_item_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_transaction_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/va_props/midtrans_cimb_va_props.dart';

class MidtransCimbVARequest {
  /// The details of the specific transaction such as `order_id` and `gross_amount`.
  final MidtransTransactionDetail transactionDetails;

  /// The details of the payment card used for the transaction.
  final MidtransCimbVaProps cimb;

  /// Details of the item(s) purchased by the customer.
  final List<MidtransItemDetail>? itemDetails;

  /// Details of the customer.
  final MidtransCustomerDetails? customerDetails;

  MidtransCimbVARequest({
    required this.transactionDetails,
    required this.cimb,
    this.itemDetails,
    this.customerDetails,
  });

  Map<String, dynamic> toJson() => {
        "payment_type": "bank_transfer",
        "transaction_details": transactionDetails.toJson(),
        "bank_transfer": cimb.toJson(),
        "item_details": itemDetails == null
            ? []
            : List<dynamic>.from(itemDetails!.map((x) => x.toJson())),
        "customer_details": customerDetails?.toJson(),
      };
}
