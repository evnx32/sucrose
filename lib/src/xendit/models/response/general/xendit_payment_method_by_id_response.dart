import 'package:sucrose/src/xendit/models/entity/xendit_actions.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_billing_information.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_card.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_direct_debit.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_ewallet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_qr_code.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_retail_outlet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_virtual_account.dart';

class XenditPaymentMethodByIdResponse {
  final String? id;
  final String? type;
  final String? country;
  final String? businessId;
  final String? customerId;
  final String? referenceId;
  final String? reusability;
  final String? status;
  final List<XenditActions>? actions;
  final dynamic description;
  final DateTime? created;
  final DateTime? updated;
  final XenditMetadata? metadata;
  final XenditBillingInformation? billingInformation;
  final String? failureCode;
  final XenditEwallet? ewallet;
  final dynamic directBankTransfer;
  final XenditDirectDebit? directDebit;
  final XenditCard? card;
  final XenditRetailOutlet? overTheCounter;
  final XenditQrCode? qrCode;
  final XenditVirtualAccount? virtualAccount;

  XenditPaymentMethodByIdResponse({
    this.id,
    this.type,
    this.country,
    this.businessId,
    this.customerId,
    this.referenceId,
    this.reusability,
    this.status,
    this.actions,
    this.description,
    this.created,
    this.updated,
    this.metadata,
    this.billingInformation,
    this.failureCode,
    this.ewallet,
    this.directBankTransfer,
    this.directDebit,
    this.card,
    this.overTheCounter,
    this.qrCode,
    this.virtualAccount,
  });

  factory XenditPaymentMethodByIdResponse.fromJson(Map<String, dynamic> json) =>
      XenditPaymentMethodByIdResponse(
        id: json["id"],
        type: json["type"],
        country: json["country"],
        businessId: json["business_id"],
        customerId: json["customer_id"],
        referenceId: json["reference_id"],
        reusability: json["reusability"],
        status: json["status"],
        actions: json["actions"] == null
            ? []
            : List<XenditActions>.from(json["actions"]!.map((x) => x)),
        description: json["description"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        metadata: json["metadata"],
        billingInformation: json["billing_information"] == null
            ? null
            : XenditBillingInformation.fromJson(json["billing_information"]),
        failureCode: json["failure_code"],
        ewallet: json["ewallet"] == null
            ? null
            : XenditEwallet.fromJson(json["ewallet"]),
        directBankTransfer: json["direct_bank_transfer"],
        directDebit: json["direct_debit"] == null
            ? null
            : XenditDirectDebit.fromJson(json["direct_debit"]),
        card: json["card"] == null ? null : XenditCard.fromJson(json["card"]),
        overTheCounter: json["over_the_counter"] == null
            ? null
            : XenditRetailOutlet.fromJson(json["over_the_counter"]),
        qrCode: json["qr_code"] == null
            ? null
            : XenditQrCode.fromJson(json["qr_code"]),
        virtualAccount: json["virtual_account"] == null
            ? null
            : XenditVirtualAccount.fromJson(json["virtual_account"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "country": country,
        "business_id": businessId,
        "customer_id": customerId,
        "reference_id": referenceId,
        "reusability": reusability,
        "status": status,
        "actions": actions == null
            ? []
            : List<XenditActions>.from(actions!.map((x) => x)),
        "description": description,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "metadata": metadata,
        "billing_information": billingInformation,
        "failure_code": failureCode,
        "ewallet": ewallet,
        "direct_bank_transfer": directBankTransfer,
        "direct_debit": directDebit,
        "card": card,
        "over_the_counter": overTheCounter,
        "qr_code": qrCode,
        "virtual_account": virtualAccount,
      };
}
