class XenditAddress {
  final String? city;
  final String? country;
  final String? postalCode;
  final String? state;
  final String? streetLine1;
  final String? streetLine2;

  XenditAddress({
    this.city,
    this.country,
    this.postalCode,
    this.state,
    this.streetLine1,
    this.streetLine2,
  });

  factory XenditAddress.fromJson(Map<String, dynamic> json) => XenditAddress(
        city: json["city"],
        country: json["country"],
        postalCode: json["postal_code"],
        state: json["state"],
        streetLine1: json["street_line1"],
        streetLine2: json["street_line2"],
      );

  Map<String, dynamic> toJson() => {
        if (city != null) "city": city,
        if (country != null) "country": country,
        if (postalCode != null) "postal_code": postalCode,
        if (state != null) "state": state,
        if (streetLine1 != null) "street_line1": streetLine1,
        if (streetLine2 != null) "street_line2": streetLine2,
      };
}
