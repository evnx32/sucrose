import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_ewallet_channel_properties.dart';
import 'package:sucrose/src/xendit/models/entity/xendit_ewallet_account.dart';

class XenditEwallet {
  /// Object that contains information of the linked eWallet account. Will be null if information is not available.
  final XenditEwalletAccount? account;

  ///	Identifier for the payment channel partner.
  final XenditEWalletCode channelCode;

  /// Information provided specific to the channel partner that was provided during the request
  final XenditEwalletChannelProperties channelProperties;

  /// Object that contains the required information to perform payments with eWallet account.
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
