import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditAddresses {
  /// Country of residence of customer
  ///
  /// Format ISO 3166-2 Country Code
  final String country;

  ///  Line 1 of street address e.g., building name and apartment number
  ///
  /// Maximum length 255 characters
  final String? streetLine1;

  /// Line 2 of street address e.g., street number and name
  ///
  /// Maximum length 255 characters
  final String? streetLine2;

  /// City, village or town of residence of customer
  ///
  /// Maximum length 255 characters
  final String? city;

  /// Province, state or region of residence of customer
  ///
  /// Maximum length 255 characters
  final String? provinceState;

  /// ZIP/Postal Code of customer

  /// Maximum length 255 characters
  final String? postalCode;

  /// Address type of customer
  final XenditAdressesCategory? category;
  final bool? isPrimary;

  XenditAddresses({
    required this.country,
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
        "country": country,
        if (streetLine1 != null) "street_line1": streetLine1,
        if (streetLine2 != null) "street_line2": streetLine2,
        if (city != null) "city": city,
        if (provinceState != null) "province_state": provinceState,
        if (postalCode != null) "postal_code": postalCode,
        if (category != null) "category": category?.name,
        if (isPrimary != null) "is_primary": isPrimary,
      };
}
