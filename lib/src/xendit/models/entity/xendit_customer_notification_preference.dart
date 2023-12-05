class XenditCustomerNotificationPreference {
  /// Specify which channel you want to notify your end customer through when you create a payment/invoice
  ///
  /// Possible enum values: ["whatsapp", "email", "viber"]
  ///
  /// If you do not specify values for this object, your end user will not be notified for this notification type
  final List<String>? invoiceCreated;

  /// Specify which channel you want to notify your end customer through when you want to remind your customer to complete their payment
  ///
  /// Possible enum values: ["whatsapp", "email", "viber"]
  ///
  /// If you do not specify values for this object, your end user will not be notified for this notification type
  final List<String>? invoiceReminder;

  /// Specify which channel you want to notify your end customer through when they have successfully completed payment
  ///
  /// Possible enum values: ["whatsapp", "email", "viber"]
  ///
  /// If you do not specify values for this object, your end user will not be notified for this notification type
  final List<String>? invoicePaid;

  // final List<String>? invoiceExpired;

  /// Object containing notification preferences for this invoice. If you wish to send notifications and reminders to your end customer, please populate the values in this object.
  ///
  /// You can also configure your notifications in your [Invoice Settings](https://dashboard.xendit.co/customize-checkout) (in your Xendit Dashboard). If you don’t set notification preferences via API, we will refer to the configurations in your [Invoice Settings](https://dashboard.xendit.co/customize-checkout) instead.
  XenditCustomerNotificationPreference({
    this.invoiceCreated,
    this.invoiceReminder,
    this.invoicePaid,
    // this.invoiceExpired,
  });

  factory XenditCustomerNotificationPreference.fromJson(
          Map<String, dynamic> json) =>
      XenditCustomerNotificationPreference(
        invoiceCreated: json["invoice_created"] == null
            ? []
            : List<String>.from(json["invoice_created"]!.map((x) => x)),
        invoiceReminder: json["invoice_reminder"] == null
            ? []
            : List<String>.from(json["invoice_reminder"]!.map((x) => x)),
        invoicePaid: json["invoice_paid"] == null
            ? []
            : List<String>.from(json["invoice_paid"]!.map((x) => x)),
        // invoiceExpired: json["invoice_expired"] == null
        //     ? []
        //     : List<String>.from(json["invoice_expired"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "invoice_created": invoiceCreated == null
            ? []
            : List<dynamic>.from(invoiceCreated!.map((x) => x)),
        "invoice_reminder": invoiceReminder == null
            ? []
            : List<dynamic>.from(invoiceReminder!.map((x) => x)),
        "invoice_paid": invoicePaid == null
            ? []
            : List<dynamic>.from(invoicePaid!.map((x) => x)),
        // "invoice_expired": invoiceExpired == null
        //     ? []
        //     : List<dynamic>.from(invoiceExpired!.map((x) => x)),
      };
}
