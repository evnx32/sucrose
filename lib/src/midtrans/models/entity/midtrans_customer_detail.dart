import 'package:sucrose/src/midtrans/models/entity/midtrans_billing_address.dart';
import 'package:sucrose/src/midtrans/models/entity/midtrans_shipping_address.dart';

class MidtransCustomerDetails {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final MidtransBillingAddress? billingAddress;
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
