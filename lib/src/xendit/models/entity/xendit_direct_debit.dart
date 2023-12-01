// To parse this JSON data, do
//
//     final xenditDirectDebit = xenditDirectDebitFromJson(jsonString);

import 'dart:convert';

import 'package:sucrose/src/xendit/models/entity/channel_properties/xendit_direct_debit_channel_properties.dart';

XenditDirectDebit xenditDirectDebitFromJson(String str) =>
    XenditDirectDebit.fromJson(json.decode(str));

String xenditDirectDebitToJson(XenditDirectDebit data) =>
    json.encode(data.toJson());

class XenditDirectDebit {
  final String? type;
  final dynamic debitCard;
  final BankAccount? bankAccount;
  final String? channelCode;
  final XenditDirectDebitChannelProperties? channelProperties;

  XenditDirectDebit({
    this.type,
    this.debitCard,
    this.bankAccount,
    this.channelCode,
    this.channelProperties,
  });

  factory XenditDirectDebit.fromJson(Map<String, dynamic> json) =>
      XenditDirectDebit(
        type: json["type"],
        debitCard: json["debit_card"],
        bankAccount: json["bank_account"] == null
            ? null
            : BankAccount.fromJson(json["bank_account"]),
        channelCode: json["channel_code"],
        channelProperties: json["channel_properties"] == null
            ? null
            : XenditDirectDebitChannelProperties.fromJson(
                json["channel_properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "debit_card": debitCard,
        "bank_account": bankAccount?.toJson(),
        "channel_code": channelCode,
        "channel_properties": channelProperties?.toJson(),
      };
}

class BankAccount {
  final String? bankAccountHash;
  final String? maskedBankAccountNumber;

  BankAccount({
    this.bankAccountHash,
    this.maskedBankAccountNumber,
  });

  factory BankAccount.fromJson(Map<String, dynamic> json) => BankAccount(
        bankAccountHash: json["bank_account_hash"],
        maskedBankAccountNumber: json["masked_bank_account_number"],
      );

  Map<String, dynamic> toJson() => {
        "bank_account_hash": bankAccountHash,
        "masked_bank_account_number": maskedBankAccountNumber,
      };
}
