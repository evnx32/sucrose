import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditAddresses {
  final String? country;
  final String? streetLine1;
  final String? streetLine2;
  final String? city;
  final String? provinceState;
  final String? postalCode;
  final XenditAdressesCategory? category;
  final bool? isPrimary;

  XenditAddresses({
    this.country,
    this.streetLine1,
    this.streetLine2,
    this.city,
    this.provinceState,
    this.postalCode,
    this.category,
    this.isPrimary,
  });

  factory XenditAddresses.fromJson(Map<String, dynamic> json) =>
      XenditAddresses(
        country: json["country"],
        streetLine1: json["street_line1"],
        streetLine2: json["street_line2"],
        city: json["city"],
        provinceState: json["province_state"],
        postalCode: json["postal_code"],
        category: XenditAdressesCategory.values
            .firstWhere((element) => element.name == json["category"]),
        isPrimary: json["is_primary"],
      );

  Map<String, dynamic> toJson() => {
        if (country != null) "country": country,
        if (streetLine1 != null) "street_line1": streetLine1,
        if (streetLine2 != null) "street_line2": streetLine2,
        if (city != null) "city": city,
        if (provinceState != null) "province_state": provinceState,
        if (postalCode != null) "postal_code": postalCode,
        if (category != null) "category": category?.name,
        if (isPrimary != null) "is_primary": isPrimary,
      };
}
