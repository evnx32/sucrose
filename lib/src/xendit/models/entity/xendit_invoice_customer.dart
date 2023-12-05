import 'package:sucrose/src/xendit/models/entity/xendit_addresses.dart';

import 'xendit_address.dart';

class XenditInvoiceCustomer {
  /// Given name of the customer
  final String? givenNames;

  /// Surname of the customer
  final String? surname;

  /// Email address of the customer
  final String? email;

  /// Mobile phone number of the customer in E164 format
  final String? mobileNumber;

  /// Array of address objects
  final List<XenditAddresses>? addresses;

  /// Object containing your end customer’s details. Please always include your customer’s email & mobile number if you wish to send email/WhatsApp notifications to them.
  XenditInvoiceCustomer({
    this.givenNames,
    this.surname,
    this.email,
    this.mobileNumber,
    this.addresses,
  });

  factory XenditInvoiceCustomer.fromJson(Map<String, dynamic> json) =>
      XenditInvoiceCustomer(
        givenNames: json["given_names"],
        surname: json["surname"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        addresses: List<XenditAddresses>.from(
            json["addresses"]!.map((x) => XenditAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        if (givenNames != null) "given_names": givenNames,
        if (surname != null) "surname": surname,
        if (email != null) "email": email,
        if (mobileNumber != null) "mobile_number": mobileNumber,
        if (addresses != null)
          "addresses": List<dynamic>.from(addresses!.map((x) => x.toJson())),
      };
}
