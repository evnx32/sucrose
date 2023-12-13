import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_retail_outlet_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_ewallet_account.dart';

class XenditFixedOTCProps {
  /// Identifier for the payment channel partner.
  final XenditEWalletCode channelCode;

  /// 	Object that contains information of the linked eWallet account. Will be null if information is not available.
  final XenditEwalletAccount? account;

  /// Timestamp in ISO 8601 UTC+0 for when the payment code will be valid.
  final DateTime? expirationDate;

  /// Information provided specific to the channel partner that was provided during the request
  final XenditRetailOutletChannelProperties channelProperties;

  /// Object that contains the required information to perform payments with eWallet account.
  XenditFixedOTCProps({
    required this.channelCode,
    this.expirationDate,
    this.account,
    required this.channelProperties,
  });

  factory XenditFixedOTCProps.fromJson(Map<String, dynamic> json) =>
      XenditFixedOTCProps(
        channelCode: json["channel_code"],
        expirationDate: json["expiration_date"] == null
            ? null
            : DateTime.parse(json["expiration_date"]),
        account: json["account"] == null
            ? null
            : XenditEwalletAccount.fromJson(json["account"]),
        channelProperties: XenditRetailOutletChannelProperties.fromJson(
          json["channel_properties"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "channel_code": channelCode.name,
        if (expirationDate != null)
          "expiration_date": expirationDate!.toIso8601String(),
        if (account != null) "account": account!.toJson(),
        "channel_properties": channelProperties.toJson(),
      };
}
