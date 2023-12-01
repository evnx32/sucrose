import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method_props/xendit_virtual_account_props.dart';

class XenditVAPaymentMethod {
  final String? referenceId;
  final XenditReusablePaymentMethod reusability;
  final XenditVirtualAccountProps virtualAccount;

  XenditVAPaymentMethod({
    this.referenceId,
    required this.reusability,
    required this.virtualAccount,
  });

  factory XenditVAPaymentMethod.fromJson(Map<String, dynamic> json) =>
      XenditVAPaymentMethod(
        referenceId: json["reference_id"],
        reusability: json["reusability"],
        virtualAccount:
            XenditVirtualAccountProps.fromJson(json["virtual_account"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "reusability": reusability.name,
        "type": "VIRTUAL_ACCOUNT",
        "virtual_account": virtualAccount.toJson(),
      };
}
