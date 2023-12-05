class XenditShippingInformation {
  ///  2-letter ISO 3166-2 country code for the customer’s shipping country
  final String country;

  ///  Building name and apartment unit number
  final String? streetLine1;

  ///Building street address
  final String? streetLine2;

  /// City, village or town as appropriate
  final String? city;

  /// Either one of (whichever is applicable):
  ///
  /// Geographic area, province, or region
  ///
  /// Formal state designation within country
  final String? provinceState;

  /// Postal, zip or rural delivery code, if applicable
  final String? postalCode;

  /// Object containing the payor's shipping address.
  XenditShippingInformation({
    required this.country,
    this.streetLine1,
    this.streetLine2,
    this.city,
    this.provinceState,
    this.postalCode,
  });

  factory XenditShippingInformation.fromJson(Map<String, dynamic> json) =>
      XenditShippingInformation(
        country: json["country"],
        streetLine1: json["street_line1"],
        streetLine2: json["street_line2"],
        city: json["city"],
        provinceState: json["province_state"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        if (streetLine1 != null) "street_line1": streetLine1,
        if (streetLine2 != null) "street_line2": streetLine2,
        if (city != null) "city": city,
        if (provinceState != null) "province_state": provinceState,
        if (postalCode != null) "postal_code": postalCode,
      };
}
