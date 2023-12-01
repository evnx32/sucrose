import 'dart:convert';
import 'package:sucrose/src/xendit/models/entity/xendit_customer.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_item.dart';
import '../../entity/xendit_customer_notification_preference.dart';
import '../../entity/xendit_fee.dart';

XenditInvoiceRequest xenditInvoiceRequestFromJson(String str) =>
    XenditInvoiceRequest.fromJson(json.decode(str));

String xenditInvoiceRequestToJson(XenditInvoiceRequest data) =>
    json.encode(data.toJson());

class XenditInvoiceRequest {
  final String externalId;
  final int amount;
  final String description;
  final String payerEmail;
  final int? invoiceDuration;
  final String? callbackVirtualAccountId;
  final XenditCustomer? customer;
  final XenditCustomerNotificationPreference? customerNotificationPreference;
  final String? successRedirectUrl;
  final String? failureRedirectUrl;
  final String? currency;
  final List<XenditItem> items;
  final List<XenditFee>? fees;

  XenditInvoiceRequest({
    required this.externalId,
    required this.amount,
    required this.description,
    required this.payerEmail,
    this.callbackVirtualAccountId,
    this.invoiceDuration,
    this.customer,
    this.customerNotificationPreference,
    this.successRedirectUrl,
    this.failureRedirectUrl,
    this.currency,
    required this.items,
    this.fees,
  });

  factory XenditInvoiceRequest.fromJson(Map<String, dynamic> json) =>
      XenditInvoiceRequest(
        externalId: json["external_id"],
        amount: json["amount"],
        description: json["description"],
        invoiceDuration: json["invoice_duration"],
        payerEmail: json["payer_email"],
        customer: json["customer"] == null
            ? null
            : XenditCustomer.fromJson(json["customer"]),
        customerNotificationPreference:
            json["customer_notification_preference"] == null
                ? null
                : XenditCustomerNotificationPreference.fromJson(
                    json["customer_notification_preference"]),
        successRedirectUrl: json["success_redirect_url"],
        failureRedirectUrl: json["failure_redirect_url"],
        currency: json["currency"],
        items: json["items"] == null
            ? []
            : List<XenditItem>.from(
                json["items"]!.map((x) => XenditItem.fromJson(x))),
        fees: json["fees"] == null
            ? []
            : List<XenditFee>.from(
                json["fees"]!.map((x) => XenditFee.fromJson(x))),
      );

  // toJson()

  Map<String, dynamic> toJson() => {
        "external_id": externalId,
        "amount": amount,
        "description": description,
        "payer_email": payerEmail,
        if (callbackVirtualAccountId != null)
          "callback_virtual_account_id": callbackVirtualAccountId,
        if (invoiceDuration != null) "invoice_duration": invoiceDuration,
        if (customer != null) "customer": customer!.toJson(),
        if (customerNotificationPreference != null)
          "customer_notification_preference":
              customerNotificationPreference!.toJson(),
        if (successRedirectUrl != null)
          "success_redirect_url": successRedirectUrl,
        if (failureRedirectUrl != null)
          "failure_redirect_url": failureRedirectUrl,
        if (currency != null) "currency": currency,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        if (fees != null)
          "fees": List<dynamic>.from(fees!.map((x) => x.toJson())),
      };
}
