// To parse this JSON data, do
//
//     final xenditAdresses = xenditAdressesFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/src/xendit/enums/enums.dart';

XenditAdresses xenditAdressesFromJson(String str) =>
    XenditAdresses.fromJson(json.decode(str));

String xenditAdressesToJson(XenditAdresses data) => json.encode(data.toJson());

class XenditAdresses {
  final String? country;
  final String? streetLine1;
  final String? streetLine2;
  final String? city;
  final String? provinceState;
  final String? postalCode;
  final XenditAdressesCategory? category;
  final bool? isPrimary;

  XenditAdresses({
    this.country,
    this.streetLine1,
    this.streetLine2,
    this.city,
    this.provinceState,
    this.postalCode,
    this.category,
    this.isPrimary,
  });

  factory XenditAdresses.fromJson(Map<String, dynamic> json) => XenditAdresses(
        country: json["country"],
        streetLine1: json["street_line1"],
        streetLine2: json["street_line2"],
        city: json["city"],
        provinceState: json["province_state"],
        postalCode: json["postal_code"],
        category: json["category"],
        isPrimary: json["is_primary"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "street_line1": streetLine1,
        "street_line2": streetLine2,
        "city": city,
        "province_state": provinceState,
        "postal_code": postalCode,
        "category": category?.name,
        "is_primary": isPrimary,
      };
}
