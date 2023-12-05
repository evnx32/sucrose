import 'package:sucrose/src/xendit/enums/enums.dart';
import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_direct_debit_channel_properties.dart';

class XenditDirectDebit {
  /// Identifier for the payment channel partner.
  final XenditDirectDebitType type;

  ///  If direct_debit.type='DEBIT_CARD', this contains details regarding the debit card to be used for payments. This will be null otherwise.
  final XenditDebitCard? debitCard;

  ///If direct_debit.type='BANK_ACCOUNT', this contains details regarding the underlying bank account of the payment method. This will be null otherwise.
  final XenditBankAccount? bankAccount;

  /// Identifier for the payment channel partner.
  final XenditDirectDebitCode channelCode;

  /// Information provided specific to the channel partner that was provided during the request.
  final XenditDirectDebitChannelProperties channelProperties;

  /// Object that contains the required information to perform payments with Direct Debit account.
  XenditDirectDebit({
    required this.type,
    this.debitCard,
    this.bankAccount,
    required this.channelCode,
    required this.channelProperties,
  });

  factory XenditDirectDebit.fromJson(Map<String, dynamic> json) =>
      XenditDirectDebit(
        type: json["type"],
        debitCard: json["debit_card"],
        bankAccount: json["bank_account"] == null
            ? null
            : XenditBankAccount.fromJson(json["bank_account"]),
        channelCode: XenditDirectDebitCode.values.firstWhere(
          (e) => e.name == json["channel_code"],
        ),
        channelProperties: XenditDirectDebitChannelProperties.fromJson(
            json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.name,
        if (debitCard != null) "debit_card": debitCard,
        if (bankAccount != null) "bank_account": bankAccount!.toJson(),
        "channel_code": channelCode.name,
        "channel_properties": channelProperties.toJson(),
      };
}

class XenditBankAccount {
  /// Unique hash for the specific account. This does not change across different authorizations or integrations. This will be null if unavailable.
  final String? bankAccountHash;

  /// Masked account details as provided by the bank. This can be used for displaying a portion of the account number. This will be null if unavailable.
  final String? maskedBankAccountNumber;

  XenditBankAccount({
    this.bankAccountHash,
    this.maskedBankAccountNumber,
  });

  factory XenditBankAccount.fromJson(Map<String, dynamic> json) =>
      XenditBankAccount(
        bankAccountHash: json["bank_account_hash"],
        maskedBankAccountNumber: json["masked_bank_account_number"],
      );

  Map<String, dynamic> toJson() => {
        if (bankAccountHash != null) "bank_account_hash": bankAccountHash,
        if (maskedBankAccountNumber != null)
          "masked_bank_account_number": maskedBankAccountNumber,
      };
}

class XenditDebitCard {
  /// Registered mobile number of the end-customer to the channel partner in E.164 Format.
  ///
  /// This will be null if not applicable.
  final String? mobileNumber;

  /// Last four digits of the debit card.
  ///
  /// This will be null if not applicable.
  final String? cardLastFour;

  /// Expiry month and year of the debit card (in MM/YY format).
  ///
  /// This will be null if not applicable.
  final String? cardExpiry;

  /// Email address of the customer that is registered to the partner channel.
  ///
  /// This will be null if not applicable.
  final String? email;

  XenditDebitCard({
    this.mobileNumber,
    this.cardLastFour,
    this.cardExpiry,
    this.email,
  });

  factory XenditDebitCard.fromJson(Map<String, dynamic> json) =>
      XenditDebitCard(
        mobileNumber: json["mobile_number"],
        cardLastFour: json["card_last_four"],
        cardExpiry: json["card_expiry"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        if (mobileNumber != null) "mobile_number": mobileNumber,
        if (cardLastFour != null) "card_last_four": cardLastFour,
        if (cardExpiry != null) "card_expiry": cardExpiry,
        if (email != null) "email": email,
      };
}
