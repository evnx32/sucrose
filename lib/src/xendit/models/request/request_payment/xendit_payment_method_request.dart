import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_billing_information.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_card.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_direct_debit.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_ewallet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_metadata.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_qr_code_response.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_retail_outlet.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_virtual_account.dart';

class XenditPaymentMethodRequest {
  final String? id;
  final XenditPaymentMethodType type;
  final String? referenceId;
  final dynamic description;
  final DateTime? created;
  final DateTime? updated;
  final XenditCard? card;
  final XenditEwallet? ewallet;
  final XenditDirectDebit? directDebit;
  final dynamic directBankTransfer;
  final XenditRetailOutlet? overTheCounter;
  final XenditVirtualAccount? virtualAccount;
  final XenditQrCodeResponse? qrCode;
  final XenditMetadata? metadata;
  final XenditBillingInformation? billingInformation;
  final XenditReusablePaymentMethod reusability;
  final String? status;

  XenditPaymentMethodRequest({
    this.id,
    required this.type,
    this.referenceId,
    this.description,
    this.created,
    this.updated,
    this.card,
    this.ewallet,
    this.directDebit,
    this.directBankTransfer,
    this.overTheCounter,
    this.virtualAccount,
    this.qrCode,
    this.metadata,
    this.billingInformation,
    required this.reusability,
    this.status,
  });

  factory XenditPaymentMethodRequest.fromJson(Map<String, dynamic> json) =>
      XenditPaymentMethodRequest(
        id: json["id"],
        type: json["type"],
        referenceId: json["reference_id"],
        description: json["description"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        card: json["card"],
        ewallet: json["ewallet"],
        directDebit: json["direct_debit"],
        directBankTransfer: json["direct_bank_transfer"],
        overTheCounter: json["over_the_counter"],
        virtualAccount: json["virtual_account"],
        qrCode: json["qr_code"] == null
            ? null
            : XenditQrCodeResponse.fromJson(json["qr_code"]),
        metadata: json["metadata"],
        billingInformation: json["billing_information"] == null
            ? null
            : XenditBillingInformation.fromJson(json["billing_information"]),
        reusability: json["reusability"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        "type": type.name,
        if (referenceId != null) "reference_id": referenceId,
        "description": description,
        if (created != null) "created": created?.toIso8601String(),
        if (updated != null) "updated": updated?.toIso8601String(),
        if (card != null) "card": card?.toJson(),
        if (ewallet != null) "ewallet": ewallet?.toJson(),
        if (directDebit != null) "direct_debit": directDebit?.toJson(),
        if (directBankTransfer != null)
          "direct_bank_transfer": directBankTransfer,
        if (overTheCounter != null)
          "over_the_counter": overTheCounter?.toJson(),
        if (virtualAccount != null) "virtual_account": virtualAccount?.toJson(),
        if (qrCode != null) "qr_code": qrCode?.toJson(),
        if (metadata != null) "metadata": metadata?.toJson(),
        if (billingInformation != null)
          "billing_information": billingInformation?.toJson(),
        "reusability": reusability.name,
        if (status != null) "status": status,
      };
}
