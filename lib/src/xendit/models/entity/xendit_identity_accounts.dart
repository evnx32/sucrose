import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditIdentityAccount {
  final XenditIdentityAccountType? type;
  final String? company;
  final String? description;
  final String? country;
  final String? properties;

  XenditIdentityAccount({
    this.type,
    this.company,
    this.description,
    this.country,
    this.properties,
  });

  factory XenditIdentityAccount.fromJson(Map<String, dynamic> json) =>
      XenditIdentityAccount(
        type: json["type"],
        company: json["company"],
        description: json["description"],
        country: json["country"],
        properties: json["properties"],
      );

  Map<String, dynamic> toJson() => {
        "type": type?.name,
        "company": company,
        "description": description,
        "country": country,
        "properties": properties,
      };
}
