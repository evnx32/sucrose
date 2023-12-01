import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/payment_method_props/xendit_ewallet_props.dart';

class XenditEwalletPaymentMethod {
  final String? referenceId;
  final XenditReusablePaymentMethod reusability;
  final XenditEwalletProps ewallet;

  XenditEwalletPaymentMethod({
    this.referenceId,
    required this.reusability,
    required this.ewallet,
  });

  factory XenditEwalletPaymentMethod.fromJson(Map<String, dynamic> json) =>
      XenditEwalletPaymentMethod(
        referenceId: json["reference_id"],
        reusability: json["reusability"],
        ewallet: XenditEwalletProps.fromJson(json["ewallet"]),
      );

  Map<String, dynamic> toJson() => {
        "reference_id": referenceId,
        "reusability": reusability.name,
        "type": "EWALLET",
        "ewallet": ewallet.toJson(),
      };
}
