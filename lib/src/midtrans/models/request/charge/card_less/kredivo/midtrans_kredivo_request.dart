import 'package:sucrose/src/midtrans/models/entity/midtrans_custom_expiry.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_customer_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_item_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_seller_detail.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_transaction_detail.dart';

class MidtransKredivoRequest {
  /// The details of the specific transaction such as `order_id` and `gross_amount`.
  final MidtransTransactionDetail transactionDetails;

  /// Details of the customer. All field in the given sample are Required.
  ///
  /// Note: By default, this field is mandatory. Merchant requires Kredivo approval to make this optional.
  final MidtransCustomerDetails customerDetails;

  /// Details of the item(s) purchased by the customer. All field in the given sample are Required.
  ///
  /// Note: By default, this field is mandatory. Merchant requires Kredivo approval to make this optional.
  final List<MidtransItemDetail>? itemDetails;

  /// Details of the seller(s) where the customer purchased from. All field in the given sample are Required.
  ///
  /// Note: This field is only mandatory for marketplace merchant.
  final List<MidtransSellerDetail>? sellerDetails;

  /// Details of the expiry time of the specific transaction. Default value: 24 hours
  final MidtransCustomExpiry? customExpiry;

  MidtransKredivoRequest({
    required this.transactionDetails,
    required this.customerDetails,
    this.itemDetails,
    this.sellerDetails,
    this.customExpiry,
  });

  factory MidtransKredivoRequest.fromJson(Map<String, dynamic> json) =>
      MidtransKredivoRequest(
        transactionDetails:
            MidtransTransactionDetail.fromJson(json["transaction_details"]),
        customerDetails:
            MidtransCustomerDetails.fromJson(json["customer_details"]),
        itemDetails: json["item_details"] == null
            ? []
            : List<MidtransItemDetail>.from(json["item_details"]!
                .map((x) => MidtransItemDetail.fromJson(x))),
        sellerDetails: json["seller_details"] == null
            ? []
            : List<MidtransSellerDetail>.from(json["seller_details"]!
                .map((x) => MidtransSellerDetail.fromJson(x))),
        customExpiry: json["custom_expiry"] == null
            ? null
            : MidtransCustomExpiry.fromJson(json["custom_expiry"]),
      );

  Map<String, dynamic> toJson() => {
        "payment_type": "kredivo",
        "transaction_details": transactionDetails.toJson(),
        "customer_details": customerDetails.toJson(),
        "item_details": itemDetails == null
            ? []
            : List<dynamic>.from(itemDetails!.map((x) => x.toJson())),
        "seller_details": sellerDetails == null
            ? []
            : List<dynamic>.from(sellerDetails!.map((x) => x.toJson())),
        "custom_expiry": customExpiry?.toJson(),
      };
}
