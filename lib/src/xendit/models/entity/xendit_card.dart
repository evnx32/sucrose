// To parse this JSON data, do
//
//     final xenditCard = xenditCardFromJson(jsonString);

import 'dart:convert';

import 'xendit_card_channel_properties.dart';

XenditCard xenditCardFromJson(String str) =>
    XenditCard.fromJson(json.decode(str));

String xenditCardToJson(XenditCard data) => json.encode(data.toJson());

class XenditCard {
  final String? currency;
  final XenditCardChannelProperties? channelProperties;
  final CardInformation? cardInformation;
  final CardVerificationResults? cardVerificationResults;
  final dynamic cardDataId;
  final dynamic isCvnSubmitted;

  XenditCard({
    this.currency,
    this.channelProperties,
    this.cardInformation,
    this.cardVerificationResults,
    this.cardDataId,
    this.isCvnSubmitted,
  });

  factory XenditCard.fromJson(Map<String, dynamic> json) => XenditCard(
        currency: json["currency"],
        channelProperties: json["channel_properties"] == null
            ? null
            : XenditCardChannelProperties.fromJson(json["channel_properties"]),
        cardInformation: json["card_information"] == null
            ? null
            : CardInformation.fromJson(json["card_information"]),
        cardVerificationResults: json["card_verification_results"] == null
            ? null
            : CardVerificationResults.fromJson(
                json["card_verification_results"]),
        cardDataId: json["card_data_id"],
        isCvnSubmitted: json["is_cvn_submitted"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "channel_properties": channelProperties?.toJson(),
        "card_information": cardInformation?.toJson(),
        "card_verification_results": cardVerificationResults?.toJson(),
        "card_data_id": cardDataId,
        "is_cvn_submitted": isCvnSubmitted,
      };
}

class CardInformation {
  final String? tokenId;
  final String? maskedCardNumber;
  final dynamic cardholderName;
  final String? expiryMonth;
  final String? expiryYear;
  final String? type;
  final String? network;
  final String? country;
  final String? issuer;
  final String? fingerprint;

  CardInformation({
    this.tokenId,
    this.maskedCardNumber,
    this.cardholderName,
    this.expiryMonth,
    this.expiryYear,
    this.type,
    this.network,
    this.country,
    this.issuer,
    this.fingerprint,
  });

  factory CardInformation.fromJson(Map<String, dynamic> json) =>
      CardInformation(
        tokenId: json["token_id"],
        maskedCardNumber: json["masked_card_number"],
        cardholderName: json["cardholder_name"],
        expiryMonth: json["expiry_month"],
        expiryYear: json["expiry_year"],
        type: json["type"],
        network: json["network"],
        country: json["country"],
        issuer: json["issuer"],
        fingerprint: json["fingerprint"],
      );

  Map<String, dynamic> toJson() => {
        "token_id": tokenId,
        "masked_card_number": maskedCardNumber,
        "cardholder_name": cardholderName,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
        "type": type,
        "network": network,
        "country": country,
        "issuer": issuer,
        "fingerprint": fingerprint,
      };
}

class CardVerificationResults {
  final String? addressVerificationResult;
  final String? cvvResult;
  final ThreeDSecure? threeDSecure;

  CardVerificationResults({
    this.addressVerificationResult,
    this.cvvResult,
    this.threeDSecure,
  });

  factory CardVerificationResults.fromJson(Map<String, dynamic> json) =>
      CardVerificationResults(
        addressVerificationResult: json["address_verification_result"],
        cvvResult: json["cvv_result"],
        threeDSecure: json["three_d_secure"] == null
            ? null
            : ThreeDSecure.fromJson(json["three_d_secure"]),
      );

  Map<String, dynamic> toJson() => {
        "address_verification_result": addressVerificationResult,
        "cvv_result": cvvResult,
        "three_d_secure": threeDSecure?.toJson(),
      };
}

class ThreeDSecure {
  final String? eciCode;
  final String? threeDSecureFlow;
  final String? threeDSecureResult;
  final dynamic threeDSecureResultReason;
  final String? threeDSecureVersion;

  ThreeDSecure({
    this.eciCode,
    this.threeDSecureFlow,
    this.threeDSecureResult,
    this.threeDSecureResultReason,
    this.threeDSecureVersion,
  });

  factory ThreeDSecure.fromJson(Map<String, dynamic> json) => ThreeDSecure(
        eciCode: json["eci_code"],
        threeDSecureFlow: json["three_d_secure_flow"],
        threeDSecureResult: json["three_d_secure_result"],
        threeDSecureResultReason: json["three_d_secure_result_reason"],
        threeDSecureVersion: json["three_d_secure_version"],
      );

  Map<String, dynamic> toJson() => {
        "eci_code": eciCode,
        "three_d_secure_flow": threeDSecureFlow,
        "three_d_secure_result": threeDSecureResult,
        "three_d_secure_result_reason": threeDSecureResultReason,
        "three_d_secure_version": threeDSecureVersion,
      };
}
