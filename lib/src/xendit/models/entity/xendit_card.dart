import 'package:sucrose/src/xendit/enums/enums.dart';

import 'channel_properties/xendit_card_channel_properties.dart';

class XenditCard {
  /// ISO 4217 three-letter code of the transaction's currency. Will be auto-filled based on the channel_code if not provided.
  final String currency;

  /// Information provided specific to the channel partner that was provided during the request
  final XenditCardChannelProperties channelProperties;

  ///	Information pertaining to the actual card
  final CardInformation cardInformation;

  /// For card transactions, this contains the results of various checks done such as 3DS, CVV, and AVS.
  final CardVerificationResults cardVerificationResults;

  /// Unique consistent identifier for the card. This does not change values over different authorizations.
  final String? cardDataId;

  /// Whether CVN was provided as part of the tokenization step.
  final bool? isCvnSubmitted;

  /// Object that contains the required information to perform payments with card
  XenditCard({
    required this.currency,
    required this.channelProperties,
    required this.cardInformation,
    required this.cardVerificationResults,
    this.cardDataId,
    this.isCvnSubmitted,
  });

  factory XenditCard.fromJson(Map<String, dynamic> json) => XenditCard(
        currency: json["currency"],
        channelProperties:
            XenditCardChannelProperties.fromJson(json["channel_properties"]),
        cardInformation: CardInformation.fromJson(json["card_information"]),
        cardVerificationResults:
            CardVerificationResults.fromJson(json["card_verification_results"]),
        cardDataId: json["card_data_id"],
        isCvnSubmitted: json["is_cvn_submitted"],
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "channel_properties": channelProperties.toJson(),
        "card_information": cardInformation.toJson(),
        "card_verification_results": cardVerificationResults.toJson(),
        if (cardDataId != null) "card_data_id": cardDataId,
        if (isCvnSubmitted != null) "is_cvn_submitted": isCvnSubmitted,
      };
}

class CardInformation {
  /// Corresponding token ID of the card
  final String tokenId;

  /// Masked card number
  final String maskedCardNumber;

  /// Cardholder name is optional but recommended for 3DS 2 / AVS verification
  final int? cardholderName;

  /// Card expiry month in MM format.
  final String expiryMonth;

  /// Card expiry year in YYYY format.
  final String expiryYear;

  /// Type of card used.
  ///
  /// Possible values:
  /// `CREDIT`
  /// `DEBIT`
  final XenditCardType? type;

  /// Card scheme of the card specified for tokenization.
  ///
  /// VISA
  ///
  /// MASTERCARD
  ///
  /// JBC
  ///
  /// AMEX
  final XenditCardNetwork? network;

  /// 2-letter country code of the issuing country of the card.
  final String? country;

  /// Name of the issuing entity of the card
  final String? issuer;

  /// Unique consistent identifier for the card. This does not change values over different authorizations.
  final int? fingerprint;

  CardInformation({
    required this.tokenId,
    required this.maskedCardNumber,
    this.cardholderName,
    required this.expiryMonth,
    required this.expiryYear,
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
        type: json["type"] == null
            ? null
            : XenditCardType.values
                .firstWhere((element) => element.name == json["type"]),
        network: json["network"] == null
            ? null
            : XenditCardNetwork.values
                .firstWhere((element) => element.name == json["network"]),
        country: json["country"],
        issuer: json["issuer"],
        fingerprint: json["fingerprint"],
      );

  Map<String, dynamic> toJson() => {
        "token_id": tokenId,
        "masked_card_number": maskedCardNumber,
        if (cardholderName != null) "cardholder_name": cardholderName,
        "expiry_month": expiryMonth,
        "expiry_year": expiryYear,
        if (type != null) "type": type!.name,
        if (network != null) "network": network!.name,
        if (country != null) "country": country,
        if (issuer != null) "issuer": issuer,
        if (fingerprint != null) "fingerprint": fingerprint,
      };
}

class CardVerificationResults {
  /// Only applicable for issuer banks that support address checks, generally works for issuer banks in the US, CA, or the UK
  final XenditAddressVerificationResult? addressVerificationResult;

  /// Indicates the result from verifying the Card Validation Value / Card Validation Code (CVV / CVC) when creating the Payment Method / token.
  final XenditCVVResult? cvvResult;

  /// Only applicable for Payment Methods when 3DS is performed. Indicates the result of any 3DS transaction initiated when Payment Method creation is performed using 3DS.
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
        if (addressVerificationResult != null)
          "address_verification_result": addressVerificationResult!.name,
        if (cvvResult != null) "cvv_result": cvvResult!.name,
        if (threeDSecure != null) "three_d_secure": threeDSecure!.toJson(),
      };
}

class ThreeDSecure {
  /// Electronic Commerce Indicator (ECI) is a number that indicates the level of security that was used when obtaining the customer’s payment credentials.An ECI is included as part of the authorization request for each transaction.
  ///
  /// 00 - Unable to authenticate (Mastercard)
  ///
  /// 01 - Authentication attempted (Mastercard)
  ///
  /// 02 - Successful authentication (Mastercard)
  ///
  /// 05 - Successful authentication (Visa, AMEX, JCB)
  ///
  /// 06 - Authentication attempted (Visa, AMEX, JCB)
  ///
  /// 07 - Unable to authenticate (Visa, AMEX, JCB)
  final String? eciCode;

  /// Whether the 3DS transaction went through a frictionless or challenge flow. Frictionless - no 2FA. Challenge - 2FA was required via OTP or other.
  final XenditTreeDSecureFlow? threeDSecureFlow;

  /// Only applicable for Payment Methods when 3DS is performed. Indicates the result of any 3DS transaction initiated when Payment Method creation is performed using 3DS.
  final XenditTreeDSecureResult? threeDSecureResult;

  /// Elaboration on the 3DS authentication result, where available
  final XenditTreeDSecureResultReason? threeDSecureResultReason;

  /// Indicates the 3DS version.
  /// null
  ///
  /// 1.0.x
  ///
  /// 2.1.x
  ///
  /// 2.2.x
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
        if (eciCode != null) "eci_code": eciCode,
        if (threeDSecureFlow != null)
          "three_d_secure_flow": threeDSecureFlow!.name,
        if (threeDSecureResult != null)
          "three_d_secure_result": threeDSecureResult!.name,
        if (threeDSecureResultReason != null)
          "three_d_secure_result_reason": threeDSecureResultReason!.name,
        if (threeDSecureVersion != null)
          "three_d_secure_version": threeDSecureVersion,
      };
}
