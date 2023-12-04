// To parse this JSON data, do
//
//     final xenditEwallet = xenditEwalletFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_ewallet_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_ewallet_account.dart';

XenditEwallet xenditEwalletFromJson(String str) =>
    XenditEwallet.fromJson(json.decode(str));

String xenditEwalletToJson(XenditEwallet data) => json.encode(data.toJson());

class XenditEwallet {
  final XenditEwalletAccount? account;
  final XenditEWalletCode channelCode;
  final XenditEwalletChannelProperties channelProperties;

  XenditEwallet({
    this.account,
    required this.channelCode,
    required this.channelProperties,
  });

  factory XenditEwallet.fromJson(Map<String, dynamic> json) => XenditEwallet(
        account: json["account"] == null
            ? null
            : XenditEwalletAccount.fromJson(json["account"]),
        channelCode: XenditEWalletCode.values.firstWhere(
          (element) => element.name == json["channel_code"],
        ),
        channelProperties:
            XenditEwalletChannelProperties.fromJson(json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        if (account != null) "account": account!.toJson(),
        "channel_code": channelCode.name,
        "channel_properties": channelProperties.toJson(),
      };
}
