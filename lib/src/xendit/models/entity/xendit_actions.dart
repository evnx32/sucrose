// To parse this JSON data, do
//
//     final xenditActions = xenditActionsFromJson(jsonString);

import 'dart:convert';

XenditActions xenditActionsFromJson(String str) =>
    XenditActions.fromJson(json.decode(str));

String xenditActionsToJson(XenditActions data) => json.encode(data.toJson());

class XenditActions {
  final String? method;
  final String? urlType;
  final String? action;
  final String? url;

  XenditActions({
    this.method,
    this.urlType,
    this.action,
    this.url,
  });

  factory XenditActions.fromJson(Map<String, dynamic> json) => XenditActions(
        method: json["method"],
        urlType: json["url_type"],
        action: json["action"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "method": method,
        "url_type": urlType,
        "action": action,
        "url": url,
      };
}
