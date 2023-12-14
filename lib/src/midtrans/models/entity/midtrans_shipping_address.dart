class MidtransShippingAddress {
  /// Customer's first name.
  final String? firstName;

  /// Customer's last name.
  final String? lastName;

  /// Customer's email address.
  final String? email;

  /// Customer's phone number.
  final String? phone;

  /// Customer's shipping address.
  final String? address;

  /// Customer's shipping city.
  final String? city;

  /// Postal code of the shipping address.
  ///
  /// **Note:** Allowed characters are alphabets, numbers, dash (-), and space ( ).
  final String? postalCode;

  /// Country ID of the shipping address. Value: IDN. ISO 3166-1 alpha-3.
  ///
  /// **Note:** Currently only `IDN` is supported.
  final String? countryCode;

  MidtransShippingAddress({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.address,
    this.city,
    this.postalCode,
    this.countryCode,
  });

  factory MidtransShippingAddress.fromJson(Map<String, dynamic> json) =>
      MidtransShippingAddress(
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
