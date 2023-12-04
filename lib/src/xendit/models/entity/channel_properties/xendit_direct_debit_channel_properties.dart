class XenditDirectDebitChannelProperties {
  /// URL where the end-customer is redirected if the authorization has failed.
  ///
  /// This will be null if not applicable. This parameter is required for all channels except BRI.
  final String? failureReturnUrl;

  /// URL where the end-customer is redirected if the authorization is successful.
  ///
  /// This will be null if not applicable. This parameter is required for all channels except BRI.
  final String? successReturnUrl;

  /// Registered mobile number of the end-customer to the channel partner in E.164 Format. This parameter is required for BRI.
  ///
  /// This will be null if not applicable.
  final String? mobileNumber;

  /// Last four digits of the debit card. This parameter is required for BRI.
  ///
  ///This will be null if not applicable.
  final String? cardLastFour;

  /// Expiry month and year of the debit card (in MM/YY format).
  ///
  /// This will be null if not applicable.
  final String? cardExpiry;

  /// Email address of the customer that is registered to the partner channel.
  ///
  /// This will be null if not applicable.
  final String? email;

  ///  The account holder's ID Card number or passport number. Required for BAY and KTB

  /// This will be null if not applicable.
  final String? identityDocumentNumber;

  XenditDirectDebitChannelProperties({
    this.failureReturnUrl,
    this.successReturnUrl,
    this.mobileNumber,
    this.cardLastFour,
    this.cardExpiry,
    this.email,
    this.identityDocumentNumber,
  });

  factory XenditDirectDebitChannelProperties.fromJson(
          Map<String, dynamic> json) =>
      XenditDirectDebitChannelProperties(
        failureReturnUrl: json["failure_return_url"],
        successReturnUrl: json["success_return_url"],
        mobileNumber: json["mobile_number"],
        cardLastFour: json["card_last_four"],
        cardExpiry: json["card_expiry"],
        email: json["email"],
        identityDocumentNumber: json["identity_document_number"],
      );

  Map<String, dynamic> toJson() => {
        if (mobileNumber != null) "mobile_number": mobileNumber,
        if (failureReturnUrl != null) "failure_return_url": failureReturnUrl,
        if (successReturnUrl != null) "success_return_url": successReturnUrl,
        if (cardLastFour != null) "card_last_four": cardLastFour,
        if (cardExpiry != null) "card_expiry": cardExpiry,
        if (email != null) "email": email,
        if (identityDocumentNumber != null)
          "identity_document_number": identityDocumentNumber,
      };
}
