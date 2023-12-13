class MidtransBillingAddress {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? address;
  final String? city;
  final String? postalCode;
  final String? countryCode;

  MidtransBillingAddress({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.postalCode,
    this.countryCode,
  });

  factory MidtransBillingAddress.fromJson(Map<String, dynamic> json) =>
      MidtransBillingAddress(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        postalCode: json["postal_code"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "address": address,
        "city": city,
        "postal_code": postalCode,
        "country_code": countryCode,
      };
}
