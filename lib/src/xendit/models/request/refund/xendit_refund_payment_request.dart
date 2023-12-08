import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditPaymentRefundRequest {
  /// Amount to be refunded to your customer. Cumulative amount refunded must not exceed the original transacted amount.
  ///
  /// If the amount field is not present in the request body, the remaining unrefunded amount of the charge would be processed
  final double? amount;

  /// Reason for refund, one of the following values can be used.
  ///
  /// Available values: `DUPLICATE`, `FRAUDULENT`, `REQUESTED_BY_CUSTOMER`, `CANCELLATION`, `OTHERS`
  final XenditRefundReason? reason;

  XenditPaymentRefundRequest({
    this.amount,
    this.reason,
  });

  factory XenditPaymentRefundRequest.fromJson(Map<String, dynamic> json) =>
      XenditPaymentRefundRequest(
        amount: json["amount"],
        reason: json["reason"],
      );

  Map<String, dynamic> toJson() => {
        if (amount != null) "amount": amount,
        if (reason != null) "reason": reason?.name,
      };
}
