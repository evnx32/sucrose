import 'xendit_address.dart';

class XenditInvoiceCustomer {
  final String? givenNames;
  final String? surname;
  final String? email;
  final String? mobileNumber;

  final List<XenditAddress>? addresses;

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
        addresses: json["addresses"] == null
            ? []
            : List<XenditAddress>.from(
                json["addresses"]!.map((x) => XenditAddress.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "given_names": givenNames,
        "surname": surname,
        "email": email,
        "mobile_number": mobileNumber,
        "addresses": addresses == null
            ? []
            : List<dynamic>.from(addresses!.map((x) => x.toJson())),
      };
}
