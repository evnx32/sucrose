class MidtransAddress {
  /// Seller's first name
  final String? firstName;

  /// Seller's last name
  final String? lastName;

  /// Seller's phone number
  final String? phone;

  /// Seller's address
  final String? address;

  /// Seller's city
  final String? city;

  /// Seller's postal code
  final String? postalCode;

  /// Seller's country code
  final String? countryCode;

  MidtransAddress({
    this.firstName,
    this.lastName,
    this.phone,
    this.address,
    this.city,
    this.postalCode,
    this.countryCode,
  });

  factory MidtransAddress.fromJson(Map<String, dynamic> json) =>
      MidtransAddress(
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        address: json["address"],
        city: json["city"],
        postalCode: json["postal_code"],
        countryCode: json["country_code"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "address": address,
        "city": city,
        "postal_code": postalCode,
        "country_code": countryCode,
      };
}
