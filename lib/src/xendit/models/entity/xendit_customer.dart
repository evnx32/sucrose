import 'xendit_address.dart';

class XenditCustomer {
  final String? givenNames;
  final String? surname;
  final String? email;
  final String? mobileNumber;

  final List<XenditAddress>? addresses;

  XenditCustomer({
    this.givenNames,
    this.surname,
    this.email,
    this.mobileNumber,
    this.addresses,
  });

  factory XenditCustomer.fromJson(Map<String, dynamic> json) => XenditCustomer(
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
