// To parse this JSON data, do
//
//     final xenditEwallet = xenditEwalletFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_ewallet_channel_properties.dart';

XenditEwallet xenditEwalletFromJson(String str) =>
    XenditEwallet.fromJson(json.decode(str));

String xenditEwalletToJson(XenditEwallet data) => json.encode(data.toJson());

class XenditEwallet {
  final Account? account;
  final String? channelCode;
  final XenditEwalletChannelProperties? channelProperties;

  XenditEwallet({
    this.account,
    this.channelCode,
    this.channelProperties,
  });

  factory XenditEwallet.fromJson(Map<String, dynamic> json) => XenditEwallet(
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        channelCode: json["channel_code"],
        channelProperties: json["channel_properties"] == null
            ? null
            : XenditEwalletChannelProperties.fromJson(
                json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        "account": account?.toJson(),
        "channel_code": channelCode,
        "channel_properties": channelProperties?.toJson(),
      };
}

class Account {
  final String? name;
  final dynamic balance;
  final dynamic pointBalance;
  final String? accountDetails;

  Account({
    this.name,
    this.balance,
    this.pointBalance,
    this.accountDetails,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        name: json["name"],
        balance: json["balance"],
        pointBalance: json["point_balance"],
        accountDetails: json["account_details"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "balance": balance,
        "point_balance": pointBalance,
        "account_details": accountDetails,
      };
}
