class XenditBillingInformation {
  final dynamic city;
  final String? country;
  final dynamic postalCode;
  final dynamic provinceState;
  final dynamic streetLine1;
  final dynamic streetLine2;

  XenditBillingInformation({
    this.city,
    this.country,
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
        "city": city,
        "country": country,
        "postal_code": postalCode,
        "province_state": provinceState,
        "street_line1": streetLine1,
        "street_line2": streetLine2,
      };
}
