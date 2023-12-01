// To parse this JSON data, do
//
//     final xenditShippingInformation = xenditShippingInformationFromJson(jsonString);

import 'dart:convert';

XenditShippingInformation xenditShippingInformationFromJson(String str) =>
    XenditShippingInformation.fromJson(json.decode(str));

String xenditShippingInformationToJson(XenditShippingInformation data) =>
    json.encode(data.toJson());

class XenditShippingInformation {
  final String? country;
  final String? streetLine1;
  final String? streetLine2;
  final String? city;
  final String? provinceState;
  final String? postalCode;

  XenditShippingInformation({
    this.country,
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
        "street_line1": streetLine1,
        "street_line2": streetLine2,
        "city": city,
        "province_state": provinceState,
        "postal_code": postalCode,
      };
}
