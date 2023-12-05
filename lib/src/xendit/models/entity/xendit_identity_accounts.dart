import 'package:sucrose/src/xendit/enums/enums.dart';

class XenditIdentityAccount {
  /// The account type.
  final XenditIdentityAccountType type;

  /// The issuing institution associated with the account (e.g., OCBC, GOPAY, 7-11). If adding financial accounts that Xendit supports, we recommend you use the [channel_code](https://developers.xendit.co/api-reference/#get-payment-channels) for this field
  ///
  /// Maximum length 100 characters
  ///
  /// Characters Alphanumeric. No special characters is allowed.
  final String? company;

  /// Free text description for the account
  ///
  /// Maximum length 255 characters
  final String? description;

  /// Issuing country for the account, if relevant
  ///
  /// Format ISO 3166-2 Country Code
  final String? country;

  /// Object with any account-specific content as required e.g.,
  final XenditIdentityAccountProperties? properties;

  /// Objects with information relating to financial, social media or other accounts associated with the customer. This array can store details for KYC purposes and can support storing of account details for execution of payments within the Xendit API ecosystem.
  XenditIdentityAccount({
    required this.type,
    this.company,
    this.description,
    this.country,
    this.properties,
  });

  factory XenditIdentityAccount.fromJson(Map<String, dynamic> json) =>
      XenditIdentityAccount(
        type: XenditIdentityAccountType.values.firstWhere(
          (element) => element.name == json["type"],
        ),
        company: json["company"],
        description: json["description"],
        country: json["country"],
        properties: json["properties"],
      );

  Map<String, dynamic> toJson() => {
        "type": type.name,
        if (company != null) "company": company,
        if (description != null) "description": description,
        if (country != null) "country": country,
        if (properties != null) "properties": properties!.toJson(),
      };
}

class XenditIdentityAccountProperties {
  /// Unique account identifier as per the bank records
  ///
  /// `Characters` Alphanumeric. No special characters is allowed.
  final String? accountNumber;

  /// Name of account holder as per the bank records. Should match the registered account name exactly
  ///
  /// `Characters` Alphanumeric. No special characters is allowed.
  final String? accountHolderName;

  /// The swift code for international payments
  ///
  /// `Characters` Alphanumeric. No special characters is allowed.
  final String? swiftCode;

  /// Free text account type, e.g., Savings, Transaction, Virtual Account
  ///
  /// `Characters` Alphanumeric. No special characters is allowed.
  final String? accountType;

  /// Potentially masked account detail, for display purposes only
  ///
  /// `Characters` Alphanumeric. No special characters is allowed.
  final String? accountDetails;

  /// Primary currency of the account, if relevant.
  ///
  /// Format ISO 4217 Currency Code
  final String? currency;

  /// string Unique account identifier as per the ewallet records
  ///
  /// Characters Alphanumeric. No special characters is allowed.
  final String? tokenId;

  /// Complete fixed payment code (including prefix)
  final String? paymentCode;

  /// Expiry date for the payment code
  ///
  /// Format YYYY-MM-DD string
  final String? expiresAt;

  /// String representation of the unique QR code
  final String? qrString;

  /// Alphanumeric string identifying this account. Usually an email address or phone number
  final String? accountId;

  /// Name of account as per the account provider
  ///
  /// `Characters` Alphanumeric. No special characters is allowed.
  final String? accountHandle;

  /// Objects with information relating to financial, social media or other accounts associated with the customer. This array can store details for KYC purposes and can support storing of account details for execution of payments within the Xendit API ecosystem.
  XenditIdentityAccountProperties({
    this.accountNumber,
    this.accountHolderName,
    this.swiftCode,
    this.accountType,
    this.accountDetails,
    this.currency,
    this.tokenId,
    this.paymentCode,
    this.expiresAt,
    this.qrString,
    this.accountId,
    this.accountHandle,
  });

  factory XenditIdentityAccountProperties.fromJson(Map<String, dynamic> json) =>
      XenditIdentityAccountProperties(
        accountNumber: json["account_number"],
        accountHolderName: json["account_holder_name"],
        swiftCode: json["swift_code"],
        accountType: json["account_type"],
        accountDetails: json["account_details"],
        currency: json["currency"],
        tokenId: json["token_id"],
        paymentCode: json["payment_code"],
        expiresAt: json["expires_at"],
        qrString: json["qr_string"],
        accountId: json["account_id"],
        accountHandle: json["account_handle"],
      );

  Map<String, dynamic> toJson() => {
        if (accountNumber != null) "account_number": accountNumber,
        if (accountHolderName != null) "account_holder_name": accountHolderName,
        if (swiftCode != null) "swift_code": swiftCode,
        if (accountType != null) "account_type": accountType,
        if (accountDetails != null) "account_details": accountDetails,
        if (currency != null) "currency": currency,
        if (tokenId != null) "token_id": tokenId,
        if (paymentCode != null) "payment_code": paymentCode,
        if (expiresAt != null) "expires_at": expiresAt,
        if (qrString != null) "qr_string": qrString,
        if (accountId != null) "account_id": accountId,
        if (accountHandle != null) "account_handle": accountHandle,
      };
}
