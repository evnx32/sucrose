class XenditBillingInformation {
  /// City, village or town as appropriate
  final String? city;

  /// 2-letter ISO 3166-2 country code for the customer’s country of residence
  final String country;

  /// Postal, zip or rural delivery code, if applicable
  final String? postalCode;

  /// Either one of (whichever is applicable):
  ///
  /// Geographic area, province, or region
  ///
  /// Formal state designation within country
  final String? provinceState;

  /// Building name and apartment unit number
  final String? streetLine1;

  /// Building street address
  final String? streetLine2;

  /// Object containing the payor's billing address. For CARD, this should match the billing information on record with the cardholder's issuer.
  XenditBillingInformation({
    this.city,
    required this.country,
    this.postalCode,
    this.provinceState,
    this.streetLine1,
    this.streetLine2,
  });

  factory XenditBillingInformation.fromJson(Map<String, dynamic> json) =>
      XenditBillingInformation(
        city: json["city"],
        country: json["country"],
        postalCode: json["postal_code"],
        provinceState: json["province_state"],
        streetLine1: json["street_line1"],
        streetLine2: json["street_line2"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        if (city != null) "city": city,
        if (postalCode != null) "postal_code": postalCode,
        if (provinceState != null) "province_state": provinceState,
        if (streetLine1 != null) "street_line1": streetLine1,
        if (streetLine2 != null) "street_line2": streetLine2,
      };
}
