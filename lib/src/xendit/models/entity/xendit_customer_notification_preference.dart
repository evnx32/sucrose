class XenditCustomerNotificationPreference {
  final List<String>? invoiceCreated;
  final List<String>? invoiceReminder;
  final List<String>? invoicePaid;
  final List<String>? invoiceExpired;

  XenditCustomerNotificationPreference({
    this.invoiceCreated,
    this.invoiceReminder,
    this.invoicePaid,
    this.invoiceExpired,
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
        invoiceExpired: json["invoice_expired"] == null
            ? []
            : List<String>.from(json["invoice_expired"]!.map((x) => x)),
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
        "invoice_expired": invoiceExpired == null
            ? []
            : List<dynamic>.from(invoiceExpired!.map((x) => x)),
      };
}
