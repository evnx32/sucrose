class MidtransSubscriptionCustomerDetails {
  /// First name of the customer
  final String? firstName;

  /// Last name of the customer
  final String? lastName;

  /// Email of the customer
  final String? email;

  /// Phone number of the customer
  final String? phone;

  /// List of required customer details fields,
  final List<String>? customerDetailsRequiredFields;

  MidtransSubscriptionCustomerDetails({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.customerDetailsRequiredFields,
  });

  factory MidtransSubscriptionCustomerDetails.fromJson(
          Map<String, dynamic> json) =>
      MidtransSubscriptionCustomerDetails(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        customerDetailsRequiredFields:
            json["customer_details_required_fields"] == null
                ? []
                : List<String>.from(
                    json["customer_details_required_fields"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "customer_details_required_fields": customerDetailsRequiredFields ==
                null
            ? []
            : List<dynamic>.from(customerDetailsRequiredFields!.map((x) => x)),
      };
}
