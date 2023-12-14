import 'package:sucrose/src/midtrans/models/entity/midtrans_billing_address.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_shipping_address.dart';

class MidtransCustomerDetails {
  /// Customer's first name.
  final String? firstName;

  /// Customer's last name.
  final String? lastName;

  /// Customer's email address.
  final String? email;

  /// Customer's phone number.
  final String? phone;

  /// Object of customer's billing address.
  final MidtransBillingAddress? billingAddress;

  /// Object of customer's shipping address.
  final MidtransShippingAddress? shippingAddress;

  MidtransCustomerDetails({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.billingAddress,
    this.shippingAddress,
  });

  factory MidtransCustomerDetails.fromJson(Map<String, dynamic> json) =>
      MidtransCustomerDetails(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        billingAddress: json["billing_address"] == null
            ? null
            : MidtransBillingAddress.fromJson(json["billing_address"]),
        shippingAddress: json["shipping_address"] == null
            ? null
            : MidtransShippingAddress.fromJson(json["shipping_address"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "billing_address": billingAddress?.toJson(),
        "shipping_address": shippingAddress?.toJson(),
      };
}
