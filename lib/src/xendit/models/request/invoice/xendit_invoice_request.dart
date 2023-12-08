import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_customer_notification_preference.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_fee.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_invoice_customer.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_invoice_item.dart';

class XenditInvoiceRequest {
  /// ID of your choice (typically the unique identifier of an invoice in your system).
  ///
  /// Min character: 1
  ///
  /// Max characters: 255 characters
  final String externalId;

  /// Amount on the invoice. Min and max amounts are stated [here](https://docs.xendit.co/xeninvoice/payment-channels).
  ///
  /// The amount should be inclusive of any fees and or items that you may choose to include. If there is a difference between this amount and the sum of the price in the items parameters and or fees parameter, Xendit will refer to this amount parameter to create invoice.
  ///
  /// Do take note: if the currency or default currency is IDR and the amount includes decimals (e.g IDR 4550.50), the amount will be truncated to IDR 4550.
  final double amount;

  /// Description of invoice - you can use this field to list what items are being paid for, or anything else of your choice that describes the function of the invoice.
  ///
  /// Min character: 1
  ///
  /// Max characters: unlimited
  final String description;

  /// Email of the payer.
  final String payerEmail;

  /// Duration of time that the end customer is given to pay the invoice before expiration (in seconds, since creation). Default is 24 hours (86,400 seconds).
  ///
  /// Min number: 1 second
  ///
  /// Max number: 31536000 seconds (1 year)
  final int? invoiceDuration;

  /// 	To allow payment via Fixed Virtual Account, pass in the id field value from the response when the fixed virtual account was created. See [Create Fixed Virtual Accounts](https://developers.xendit.co/api-reference/#create-virtual-account)
  final String? callbackVirtualAccountId;

  /// 	Object containing your end customer’s details. Please always include your customer’s email & mobile number if you wish to send email/WhatsApp notifications to them.
  final XenditInvoiceCustomer? customer;

  /// Object containing notification preferences for this invoice. If you wish to send notifications and reminders to your end customer, please populate the values in this object.
  ///
  /// You can also configure your notifications in your [Invoice Settings](https://dashboard.xendit.co/customize-checkout) (in your Xendit Dashboard). If you don’t set notification preferences via API, we will refer to the configurations in your [Invoice Settings](https://dashboard.xendit.co/customize-checkout).
  final XenditCustomerNotificationPreference? customerNotificationPreference;

  /// URL that the end customer will be redirected to upon successful invoice payment.
  ///
  /// Example : https://yourcompany.com/example_item/10/success_page.
  ///
  /// Min character: 1
  ///
  /// Max characters: 255 characters
  final String? successRedirectUrl;

  /// URL that end user will be redirected to upon expiration of this invoice.
  ///
  /// Example : https://yourcompany.com/example_item/10/failed_checkout.
  ///
  /// Min character: 1
  ///
  /// Max characters: 255 characters
  final String? failureRedirectUrl;

  /// Currency of the amount that you created
  final XenditInvoiceCurrency? currency;

  /// Objects describing the item(s) purchased. Max array size: 75. Mandatory for PayLater payment method.
  final List<XenditInvoiceItem> items;

  /// objects describing the fee(s) that you charge to your end customer. This can be an admin fee, logistics fee, etc. This amount will be included in the total invoice amount and will be transferred to your balance when the transaction settles. Max array size: 10.
  final List<XenditFee>? fees;

  /// Object that contains the required information to perform payments with invoice
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
            : XenditInvoiceCustomer.fromJson(json["customer"]),
        customerNotificationPreference:
            json["customer_notification_preference"] == null
                ? null
                : XenditCustomerNotificationPreference.fromJson(
                    json["customer_notification_preference"]),
        successRedirectUrl: json["success_redirect_url"],
        failureRedirectUrl: json["failure_redirect_url"],
        currency: json["currency"] == null
            ? null
            : XenditInvoiceCurrency.values
                .firstWhere((element) => element.name == json["currency"]),
        items: json["items"] == null
            ? []
            : List<XenditInvoiceItem>.from(
                json["items"]!.map((x) => XenditInvoiceItem.fromJson(x))),
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
        if (currency != null) "currency": currency!.name,
        "items": List<XenditInvoiceItem>.from(items.map((x) => x.toJson())),
        if (fees != null)
          "fees": List<XenditFee>.from(fees!.map((x) => x.toJson())),
      };
}
