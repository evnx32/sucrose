import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_retail_outlet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_virtual_account.dart';

class XenditUpdateEwalletRequest {
  /// Merchant-provided identifier for this payment request.
  ///
  /// If none is provided, Xendit will randomly generate a unique reference_id.
  ///
  /// This is optional
  final String? referenceId;

  /// Whether the account can be reused for future payments.
  ///
  /// This is optional
  final XenditReusablePaymentMethod? reusability;

  /// The status of the payment method.
  ///
  /// This is optional
  final XenditPaymentMethodStatus? status;

  /// For type='OVER_THE_COUNTER', the following properties may be updated
  ///
  /// This is optional
  final XenditRetailOutlet? overTheCounter;

  /// For type='VIRTUAL_ACCOUNT', the following properties may be updated
  ///
  /// This is optional
  final XenditVirtualAccount? virtualAccount;

  /// Description of the payment request that will be shown to the user (e.g. on invoices).
  ///
  /// This is optional
  final String? description;

  XenditUpdateEwalletRequest({
    this.referenceId,
    required this.reusability,
    required this.status,
    this.overTheCounter,
    this.virtualAccount,
    this.description,
  });

  factory XenditUpdateEwalletRequest.fromJson(Map<String, dynamic> json) =>
      XenditUpdateEwalletRequest(
        referenceId: json["reference_id"],
        reusability: json["reusability"],
        status: json["status"],
        overTheCounter: json["over_the_counter"],
        virtualAccount: json["virtual_account"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        if (referenceId != null) "reference_id": referenceId,
        if (reusability != null) "reusability": reusability?.name,
        if (status != null) "status": status?.name,
        if (overTheCounter != null)
          "over_the_counter": overTheCounter!.toJson(),
        if (virtualAccount != null) "virtual_account": virtualAccount!.toJson(),
        if (description != null) "description": description,
      };
}
