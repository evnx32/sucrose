import 'package:sucrose/src/xendit/models/entity/xendit_invoice_customer.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_invoice_item.dart';

import '../../entity/xendit_customer_notification_preference.dart';
import '../../entity/xendit_fee.dart';

class XenditInvoiceResponse {
  final String? id;
  final String? externalId;
  final String? userId;
  final String? status;
  final String? merchantName;
  final String? merchantProfilePictureUrl;
  final int? amount;
  final String? description;
  final DateTime? expiryDate;
  final String? invoiceUrl;
  final List<AvailableBank>? availableBanks;
  final List<AvailableRetailOutlet>? availableRetailOutlets;
  final List<AvailableEwallet>? availableEwallets;
  final List<AvailableQrCode>? availableQrCodes;
  final List<AvailableDirectDebit>? availableDirectDebits;
  final List<AvailablePaylater>? availablePaylaters;
  final bool? shouldExcludeCreditCard;
  final bool? shouldSendEmail;
  final String? successRedirectUrl;
  final String? failureRedirectUrl;
  final DateTime? created;
  final DateTime? updated;
  final String? currency;
  final List<XenditInvoiceItem>? items;
  final List<XenditFee>? fees;
  final XenditInvoiceCustomer? customer;
  final XenditCustomerNotificationPreference? customerNotificationPreference;

  XenditInvoiceResponse({
    this.id,
    this.externalId,
    this.userId,
    this.status,
    this.merchantName,
    this.merchantProfilePictureUrl,
    this.amount,
    this.description,
    this.expiryDate,
    this.invoiceUrl,
    this.availableBanks,
    this.availableRetailOutlets,
    this.availableEwallets,
    this.availableQrCodes,
    this.availableDirectDebits,
    this.availablePaylaters,
    this.shouldExcludeCreditCard,
    this.shouldSendEmail,
    this.successRedirectUrl,
    this.failureRedirectUrl,
    this.created,
    this.updated,
    this.currency,
    this.items,
    this.fees,
    this.customer,
    this.customerNotificationPreference,
  });

  factory XenditInvoiceResponse.fromJson(Map<String, dynamic> json) =>
      XenditInvoiceResponse(
        id: json["id"],
        externalId: json["external_id"],
        userId: json["user_id"],
        status: json["status"],
        merchantName: json["merchant_name"],
        merchantProfilePictureUrl: json["merchant_profile_picture_url"],
        amount: json["amount"],
        description: json["description"],
        expiryDate: json["expiry_date"] == null
            ? null
            : DateTime.parse(json["expiry_date"]),
        invoiceUrl: json["invoice_url"],
        availableBanks: json["available_banks"] == null
            ? []
            : List<AvailableBank>.from(
                json["available_banks"]!.map((x) => AvailableBank.fromJson(x))),
        availableRetailOutlets: json["available_retail_outlets"] == null
            ? []
            : List<AvailableRetailOutlet>.from(json["available_retail_outlets"]!
                .map((x) => AvailableRetailOutlet.fromJson(x))),
        availableEwallets: json["available_ewallets"] == null
            ? []
            : List<AvailableEwallet>.from(json["available_ewallets"]!
                .map((x) => AvailableEwallet.fromJson(x))),
        availableQrCodes: json["available_qr_codes"] == null
            ? []
            : List<AvailableQrCode>.from(json["available_qr_codes"]!
                .map((x) => AvailableQrCode.fromJson(x))),
        availableDirectDebits: json["available_direct_debits"] == null
            ? []
            : List<AvailableDirectDebit>.from(json["available_direct_debits"]!
                .map((x) => AvailableDirectDebit.fromJson(x))),
        availablePaylaters: json["available_paylaters"] == null
            ? []
            : List<AvailablePaylater>.from(json["available_paylaters"]!
                .map((x) => AvailablePaylater.fromJson(x))),
        shouldExcludeCreditCard: json["should_exclude_credit_card"],
        shouldSendEmail: json["should_send_email"],
        successRedirectUrl: json["success_redirect_url"],
        failureRedirectUrl: json["failure_redirect_url"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        currency: json["currency"],
        items: json["items"] == null
            ? []
            : List<XenditInvoiceItem>.from(
                json["items"]!.map((x) => XenditInvoiceItem.fromJson(x))),
        fees: json["fees"] == null
            ? []
            : List<XenditFee>.from(
                json["fees"]!.map((x) => XenditFee.fromJson(x))),
        customer: json["customer"] == null
            ? null
            : XenditInvoiceCustomer.fromJson(json["customer"]),
        customerNotificationPreference:
            json["customer_notification_preference"] == null
                ? null
                : XenditCustomerNotificationPreference.fromJson(
                    json["customer_notification_preference"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "external_id": externalId,
        "user_id": userId,
        "status": status,
        "merchant_name": merchantName,
        "merchant_profile_picture_url": merchantProfilePictureUrl,
        "amount": amount,
        "description": description,
        "expiry_date": expiryDate?.toIso8601String(),
        "invoice_url": invoiceUrl,
        "available_banks": availableBanks == null
            ? []
            : List<dynamic>.from(availableBanks!.map((x) => x.toJson())),
        "available_retail_outlets": availableRetailOutlets == null
            ? []
            : List<dynamic>.from(
                availableRetailOutlets!.map((x) => x.toJson())),
        "available_ewallets": availableEwallets == null
            ? []
            : List<dynamic>.from(availableEwallets!.map((x) => x.toJson())),
        "available_qr_codes": availableQrCodes == null
            ? []
            : List<dynamic>.from(availableQrCodes!.map((x) => x.toJson())),
        "available_direct_debits": availableDirectDebits == null
            ? []
            : List<dynamic>.from(availableDirectDebits!.map((x) => x.toJson())),
        "available_paylaters": availablePaylaters == null
            ? []
            : List<dynamic>.from(availablePaylaters!.map((x) => x.toJson())),
        "should_exclude_credit_card": shouldExcludeCreditCard,
        "should_send_email": shouldSendEmail,
        "success_redirect_url": successRedirectUrl,
        "failure_redirect_url": failureRedirectUrl,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "currency": currency,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "fees": fees == null
            ? []
            : List<dynamic>.from(fees!.map((x) => x.toJson())),
        "customer": customer?.toJson(),
        "customer_notification_preference":
            customerNotificationPreference?.toJson(),
      };
}

class AvailableBank {
  final String? bankCode;
  final String? collectionType;
  final int? transferAmount;
  final String? bankBranch;
  final String? accountHolderName;
  final int? identityAmount;

  AvailableBank({
    this.bankCode,
    this.collectionType,
    this.transferAmount,
    this.bankBranch,
    this.accountHolderName,
    this.identityAmount,
  });

  // toJson
  factory AvailableBank.fromJson(Map<String, dynamic> json) => AvailableBank(
        bankCode: json["bank_code"],
        collectionType: json["collection_type"],
        transferAmount: json["transfer_amount"],
        bankBranch: json["bank_branch"],
        accountHolderName: json["account_holder_name"],
        identityAmount: json["identity_amount"],
      );

  // fromJson
  Map<String, dynamic> toJson() => {
        "bank_code": bankCode,
        "collection_type": collectionType,
        "transfer_amount": transferAmount,
        "bank_branch": bankBranch,
        "account_holder_name": accountHolderName,
        "identity_amount": identityAmount,
      };
}

class AvailableDirectDebit {
  final String? directDebitType;

  AvailableDirectDebit({
    this.directDebitType,
  });

  factory AvailableDirectDebit.fromJson(Map<String, dynamic> json) =>
      AvailableDirectDebit(
        directDebitType: json["direct_debit_type"],
      );

  Map<String, dynamic> toJson() => {
        "direct_debit_type": directDebitType,
      };
}

class AvailableEwallet {
  final String? ewalletType;

  AvailableEwallet({
    this.ewalletType,
  });

  factory AvailableEwallet.fromJson(Map<String, dynamic> json) =>
      AvailableEwallet(
        ewalletType: json["ewallet_type"],
      );

  Map<String, dynamic> toJson() => {
        "ewallet_type": ewalletType,
      };
}

class AvailablePaylater {
  final String? paylaterType;

  AvailablePaylater({
    this.paylaterType,
  });

  factory AvailablePaylater.fromJson(Map<String, dynamic> json) =>
      AvailablePaylater(
        paylaterType: json["paylater_type"],
      );

  Map<String, dynamic> toJson() => {
        "paylater_type": paylaterType,
      };
}

class AvailableQrCode {
  final String? qrCodeType;

  AvailableQrCode({
    this.qrCodeType,
  });

  factory AvailableQrCode.fromJson(Map<String, dynamic> json) =>
      AvailableQrCode(
        qrCodeType: json["qr_code_type"],
      );

  Map<String, dynamic> toJson() => {
        "qr_code_type": qrCodeType,
      };
}

class AvailableRetailOutlet {
  final String? retailOutletName;

  AvailableRetailOutlet({
    this.retailOutletName,
  });

  factory AvailableRetailOutlet.fromJson(Map<String, dynamic> json) =>
      AvailableRetailOutlet(
        retailOutletName: json["retail_outlet_name"],
      );

  Map<String, dynamic> toJson() => {
        "retail_outlet_name": retailOutletName,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
