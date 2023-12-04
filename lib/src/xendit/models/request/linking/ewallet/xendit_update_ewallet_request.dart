import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_retail_outlet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_virtual_account.dart';

class XenditUpdateEwalletRequest {
  final String? referenceId;
  final XenditReusablePaymentMethod? reusability;
  final XenditPaymentMethodStatus? status;
  final XenditRetailOutlet? overTheCounter;
  final XenditVirtualAccount? virtualAccount;
  final String? description;

  XenditUpdateEwalletRequest({
    this.referenceId,
    this.reusability,
    this.status,
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
        if (reusability != null) "reusability": reusability!.name,
        if (status != null) "status": status!.name,
        if (overTheCounter != null)
          "over_the_counter": overTheCounter!.toJson(),
        if (virtualAccount != null) "virtual_account": virtualAccount!.toJson(),
        if (description != null) "description": description,
      };
}
